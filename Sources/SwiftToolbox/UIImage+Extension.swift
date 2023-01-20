//
//  Copyright © 2017-2019 Werner Freytag. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
    public extension UIImage {
        fileprivate convenience init?(image: UIImage?) {
            guard let image = image, let cgImage = image.cgImage else { return nil }
            self.init(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
        }

        /// Create empty image with specified size and optional fill color
        convenience init?(size: CGSize, color: UIColor? = nil) {
            let rect = CGRect(origin: .zero, size: size)
            guard let context = UIGraphicsBeginImageContext(size: size) else { return nil }
            defer { UIGraphicsEndImageContext() }

            if let color = color {
                context.setFillColor(color.cgColor)
                context.fill(rect)
            }

            self.init(image: UIGraphicsGetImageFromCurrentImageContext())
        }
    }
#endif

#if os(iOS) || os(tvOS)
    public extension UIImage {
        /// Create an image with the size and bitmap content of a view
        convenience init?(contentsOf view: UIView) {
            self.init(contentsOf: view, in: view.bounds)
        }

        /// Create an image with bitmap content of a view
        convenience init?(contentsOf view: UIView, in rect: CGRect) {
            guard let context = UIGraphicsBeginImageContext(size: rect.size) else { return nil }
            defer { UIGraphicsEndImageContext() }

            context.saveGState()
            context.translateBy(x: 0, y: rect.size.height)
            context.scaleBy(x: 1, y: -1)
            context.translateBy(x: rect.origin.x, y: -rect.origin.y)
            view.setNeedsDisplay()
            view.layer.render(in: context)
            context.restoreGState()

            self.init(image: UIGraphicsGetImageFromCurrentImageContext())
        }
    }
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
    public extension UIImage {
        /// Create a tinted version of an image
        func colored(with color: UIColor) -> UIImage? {
            guard let context = UIGraphicsBeginImageContext(size: size, scale: scale) else { return nil }
            defer { UIGraphicsEndImageContext() }

            // set the fill color
            color.setFill()

            // set the blend mode to color burn, and the original image
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            context.clip(to: rect, mask: cgImage!)

            // set a mask that matches the shape of the image, then draw (color burn) a colored rectangle
            context.fill(rect)

            // generate a new UIImage from the graphics context we drew onto
            return UIGraphicsGetImageFromCurrentImageContext()
        }

        /// Create a version of an image modifying the alpha component
        func withAlpha(_ alpha: CGFloat) -> UIImage? {
            guard let context = UIGraphicsBeginImageContext(size: size, scale: scale) else { return self }
            defer { UIGraphicsEndImageContext() }

            let rect = CGRect(origin: .zero, size: size)
            context.setBlendMode(.multiply)
            context.setAlpha(alpha)
            context.draw(cgImage!, in: rect)
            return UIGraphicsGetImageFromCurrentImageContext()
        }

        enum ContentMode {
            case scaleToFill
            case scaleAspectFit
            case scaleAspectFill
            case center
        }

        /// Create a resized version of an image
        func resized(to size: CGSize, mode: ContentMode = .scaleAspectFill) -> UIImage? {
            guard self.size != size else { return self }

            guard let context = UIGraphicsBeginImageContext(size: size, scale: scale) else { return nil }
            defer { UIGraphicsEndImageContext() }

            let targetSize: CGSize

            switch mode {
            case .scaleToFill:
                targetSize = size

            case .scaleAspectFit:
                let factor = min(size.width / self.size.width, size.height / self.size.height)
                targetSize = CGSize(width: factor * self.size.width, height: factor * self.size.height)

            case .scaleAspectFill:
                let factor = max(size.width / self.size.width, size.height / self.size.height)
                targetSize = CGSize(width: factor * self.size.width, height: factor * self.size.height)

            case .center:
                targetSize = self.size
            }

            let center = CGPoint(x: (size.width - targetSize.width) / 2, y: (size.height - targetSize.height) / 2)
            let targetRect = CGRect(origin: center, size: targetSize)

            context.draw(cgImage!, in: targetRect)
            return UIGraphicsGetImageFromCurrentImageContext()
        }

        /// Create an image with a part of another image
        func cropped(to rect: CGRect) -> UIImage? {
            guard let context = UIGraphicsBeginImageContext(size: rect.size, scale: scale) else { return nil }
            defer { UIGraphicsEndImageContext() }

            context.saveGState()
            context.translateBy(x: rect.minX, y: rect.minY)
            context.restoreGState()
            context.clip()
            context.draw(cgImage!, in: CGRect(origin: .zero, size: size))
            return UIGraphicsGetImageFromCurrentImageContext()
        }
    }

    public func UIGraphicsBeginImageContext(size: CGSize, scale: CGFloat = 0) -> CGContext? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1, y: -1)
        return context
    }

#endif
