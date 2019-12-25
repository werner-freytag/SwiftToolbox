//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import CoreGraphics

#if os(OSX)
    import AppKit.NSColor
    public typealias Color = NSColor
#else
    import UIKit.UIColor
    public typealias Color = UIColor
#endif

#if os(macOS)
    extension Color {
        public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            self.init(srgbRed: red, green: green, blue: blue, alpha: alpha)
        }
    }

#else
    private typealias HSBComponents = (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)

    extension Color {
        private var hsbComponents: HSBComponents {
            var components = HSBComponents(hue: 0, saturation: 0, brightness: 0, alpha: 0)
            getHue(&components.hue, saturation: &components.saturation, brightness: &components.brightness, alpha: &components.alpha)

            return components
        }

        public var hueComponent: CGFloat {
            return hsbComponents.hue
        }

        public var saturationComponent: CGFloat {
            return hsbComponents.saturation
        }

        public var brightnessComponent: CGFloat {
            return hsbComponents.brightness
        }

        public var alphaComponent: CGFloat {
            return hsbComponents.alpha
        }
    }
#endif

public extension Color {
    private typealias RGBComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

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

    var visualBrightness: CGFloat {
        guard let components = rgbComponents else { return 0 }
        return ((components.red * 299) + (components.green * 587) + (components.blue * 114)) / 1000
    }

    func withBrightnessComponent(_ brightness: CGFloat) -> Color {
        return Color(hue: hueComponent, saturation: saturationComponent, brightness: brightness, alpha: alphaComponent)
    }

    func withSaturationComponent(_ saturation: CGFloat) -> Color {
        return Color(hue: hueComponent, saturation: saturation, brightness: brightnessComponent, alpha: alphaComponent)
    }

    func withHueComponent(_ hue: CGFloat) -> Color {
        return Color(hue: hue, saturation: saturationComponent, brightness: brightnessComponent, alpha: alphaComponent)
    }

    func darken(_ percentage: CGFloat) -> Color {
        return withBrightnessComponent(decrease(brightnessComponent, percentage))
    }

    func lighten(_ percentage: CGFloat) -> Color {
        return withBrightnessComponent(increase(brightnessComponent, percentage))
    }

    func desaturate(_ percentage: CGFloat) -> Color {
        return withSaturationComponent(decrease(saturationComponent, percentage))
    }

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
