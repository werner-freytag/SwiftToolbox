//
//  Copyright © Werner Freytag. All rights reserved.
//

import CoreGraphics

#if os(OSX)
    import AppKit.NSColor

    /// unify NSColor and UIColor as Color
    public typealias Color = NSColor
#else
    import UIKit.UIColor

    /// unify NSColor and UIColor as Color
    public typealias Color = UIColor
#endif

#if os(macOS)
    public extension Color {
        /// Creates a color object using the specified opacity and RGB component values.
        /// - Parameters:
        ///   - red: The red value of the color object
        ///   - green: The green value of the color object
        ///   - blue: The blue value of the color object
        ///   - alpha: The alpha value of the color object
        convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            self.init(srgbRed: red, green: green, blue: blue, alpha: alpha)
        }
    }
#else
    private typealias HSBComponents = (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)

    public extension Color {
        private var hsbComponents: HSBComponents {
            var components = HSBComponents(hue: 0, saturation: 0, brightness: 0, alpha: 0)
            getHue(&components.hue, saturation: &components.saturation, brightness: &components.brightness, alpha: &components.alpha)

            return components
        }

        /// The hue component value of the color.
        var hueComponent: CGFloat {
            return hsbComponents.hue
        }

        /// The saturation component value of the color.
        var saturationComponent: CGFloat {
            return hsbComponents.saturation
        }

        /// The brightness component value of the color.
        var brightnessComponent: CGFloat {
            return hsbComponents.brightness
        }

        /// The alpha (opacity) component value of the color.
        var alphaComponent: CGFloat {
            return hsbComponents.alpha
        }
    }
#endif

public extension Color {
    /// Creates a color object using the specified opacity and combined hex component value
    /// - Parameters:
    ///   - hex: The hex components, for example 0x00aaff
    ///   - alpha: The opacity value
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let components = (
            CGFloat((hex >> 16) & 0xFF) / 255,
            CGFloat((hex >> 08) & 0xFF) / 255,
            CGFloat((hex >> 00) & 0xFF) / 255
        )
        self.init(red: components.0, green: components.1, blue: components.2, alpha: alpha)
    }
}

public extension Color {
    fileprivate typealias RGBComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

    private var rgbComponents: RGBComponents? {
        #if os(OSX)
            guard let rgbColor = usingColorSpace(.genericRGB) else { return nil }
        #else
            let rgbColor = self
        #endif

        var components = RGBComponents(red: 0, green: 0, blue: 0, alpha: 0)
        rgbColor.getRed(&components.red, green: &components.green, blue: &components.blue, alpha: &components.alpha)

        return components
    }

    /// A brightness component of the color based on visual perception
    var visualBrightness: CGFloat {
        guard let components = rgbComponents else { return 0 }
        return ((components.red * 299) + (components.green * 587) + (components.blue * 114)) / 1000
    }

    /// Apply a new brightness component to the color
    /// - Parameter brightness: The new brightness value
    /// - Returns: The modified color
    func withBrightnessComponent(_ brightness: CGFloat) -> Color {
        return Color(hue: hueComponent, saturation: saturationComponent, brightness: brightness, alpha: alphaComponent)
    }

    /// Apply a new saturation component to the color
    /// - Parameter saturation: The new saturation value
    /// - Returns: The modified color
    func withSaturationComponent(_ saturation: CGFloat) -> Color {
        return Color(hue: hueComponent, saturation: saturation, brightness: brightnessComponent, alpha: alphaComponent)
    }

    /// Apply a new hue value to the color
    /// - Parameter hue: The new hue value
    /// - Returns: The modified color
    func withHueComponent(_ hue: CGFloat) -> Color {
        return Color(hue: hue, saturation: saturationComponent, brightness: brightnessComponent, alpha: alphaComponent)
    }

    /// Darken the color by  a percentage value
    /// - Parameter percentage: The percentage value
    /// - Returns: The modified color
    func darken(_ percentage: CGFloat) -> Color {
        return withBrightnessComponent(decrease(brightnessComponent, percentage))
    }

    /// Lighten the color by  a percentage value
    /// - Parameter percentage: The percentage value
    /// - Returns: The modified color
    func lighten(_ percentage: CGFloat) -> Color {
        return withBrightnessComponent(increase(brightnessComponent, percentage))
    }

    /// Desaturate the color by  a percentage value
    /// - Parameter percentage: The percentage value
    /// - Returns: The modified color
    func desaturate(_ percentage: CGFloat) -> Color {
        return withSaturationComponent(decrease(saturationComponent, percentage))
    }

    /// Saturate the color by  a percentage value
    /// - Parameter percentage: The percentage value
    /// - Returns: The modified color
    func saturate(_ percentage: CGFloat) -> Color {
        return withSaturationComponent(increase(saturationComponent, percentage))
    }

    private func increase(_ value: CGFloat, _ percentage: CGFloat) -> CGFloat {
        return min(1, value * (1 + percentage))
    }

    private func decrease(_ value: CGFloat, _ percentage: CGFloat) -> CGFloat {
        return max(0, value * (1 - percentage))
    }
}

public extension Color {
    /// Return the hex value of the color combining red, green and blue component
    var hex: Int {
        guard let rgb = rgbComponents
        else { assertionFailure(); return -1 }

        return (Int(rgb.red * 255) & 0xFF) << 16
            + (Int(rgb.green * 255) & 0xFF) << 8
            + (Int(rgb.blue * 255) & 0xFF)
    }
}
