//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
import SwiftToolbox
import XCTest

#if os(OSX)
    import AppKit.NSColor
    fileprivate typealias Color = NSColor
#else
    import UIKit.UIColor
    fileprivate typealias Color = UIColor
#endif

class ColorExtensionTests: XCTestCase {
    private var colors = (
        white: Color.white,
        black: Color.black,
        namedRed: Color.red,
        rgbRed: Color(red: 1, green: 0, blue: 0, alpha: 1),
        hsbRed: Color(hue: 0, saturation: 1, brightness: 1, alpha: 1),
        namedGreen: Color.green,
        rgbGreen: Color(red: 0, green: 1, blue: 0, alpha: 1),
        hsbGreen: Color(hue: 0.333, saturation: 1, brightness: 1, alpha: 1),
        namedBlue: Color.blue,
        rgbBlue: Color(red: 0, green: 0, blue: 1, alpha: 1),
        hsbBlue: Color(hue: 0.666, saturation: 1, brightness: 1, alpha: 1),
        namedGrayWithAlpha: Color.gray.withAlphaComponent(0.5),
        rgbGrayWithAlpha: Color(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5),
        hsbGrayWithAlpha: Color(hue: 0, saturation: 0, brightness: 0.5, alpha: 0.5)
    )

    func testVisualBrightness() {
        expect(self.colors.white.visualBrightness) == 1
        expect(self.colors.namedGreen.visualBrightness) ≈ (0.63, 0.1)
        expect(self.colors.rgbGreen.visualBrightness) ≈ (0.63, 0.1)
        expect(self.colors.hsbGreen.visualBrightness) ≈ (0.63, 0.1)

        expect(self.colors.black.visualBrightness) == 0
        expect(self.colors.namedRed.visualBrightness) ≈ (0.3, 0.1)
        expect(self.colors.rgbRed.visualBrightness) ≈ (0.3, 0.1)
        expect(self.colors.hsbRed.visualBrightness) ≈ (0.3, 0.1)

        expect(self.colors.namedBlue.visualBrightness) ≈ (0.11, 0.1)
        expect(self.colors.rgbBlue.visualBrightness) ≈ (0.11, 0.1)
        expect(self.colors.hsbBlue.visualBrightness) ≈ (0.11, 0.1)

        expect(self.colors.namedGrayWithAlpha.visualBrightness) ≈ (0.42, 0.1)
        expect(self.colors.rgbGrayWithAlpha.visualBrightness) ≈ (0.42, 0.1)
        expect(self.colors.hsbGrayWithAlpha.visualBrightness) ≈ (0.42, 0.1)
    }

    #if os(macOS)
        func testInitRgb() {
            expect(Color(red: 0, green: 0.5, blue: 1, alpha: 0.75)) == Color(srgbRed: 0, green: 0.5, blue: 1, alpha: 0.75)
        }
    #endif

    func testWithBrightnessComponent() {
        expect(self.colors.namedGreen.withBrightnessComponent(0.5)) == Color(red: 0, green: 0.5, blue: 0, alpha: 1)
        expect(self.colors.rgbGreen.withBrightnessComponent(0.5)) == Color(red: 0, green: 0.5, blue: 0, alpha: 1)
        expect(self.colors.hsbGreen.withBrightnessComponent(0.5)) == Color(hue: 0.333, saturation: 1, brightness: 0.5, alpha: 1)
    }

    func testWithSaturationComponent() {
        expect(self.colors.namedGreen.withSaturationComponent(0.5)) == Color(red: 0.5, green: 1, blue: 0.5, alpha: 1)
        expect(self.colors.rgbGreen.withSaturationComponent(0.5)) == Color(red: 0.5, green: 1, blue: 0.5, alpha: 1)
        expect(self.colors.hsbGreen.withSaturationComponent(0.5)) == Color(hue: 0.333, saturation: 0.5, brightness: 1, alpha: 1)
    }

    func testWithHueComponent() {
        expect(self.colors.namedGreen.withHueComponent(0)) == Color(red: 1, green: 0, blue: 0, alpha: 1)
        expect(self.colors.rgbGreen.withHueComponent(0)) == Color(red: 1, green: 0, blue: 0, alpha: 1)
        expect(self.colors.hsbGreen.withHueComponent(0)) == Color(hue: 0, saturation: 1, brightness: 1, alpha: 1)
    }

    func testDarken() {
        expect(self.colors.namedGreen.darken(0.5)) == Color(red: 0, green: 0.5, blue: 0, alpha: 1)
        expect(self.colors.rgbGreen.darken(0.5)) == Color(red: 0, green: 0.5, blue: 0, alpha: 1)
        expect(self.colors.hsbGreen.darken(0.5)) == Color(hue: 0.333, saturation: 1, brightness: 0.5, alpha: 1)

        // There is no blacker than black
        expect(Color(red: 0, green: 0, blue: 0, alpha: 1).darken(0.5)) == Color(red: 0, green: 0, blue: 0, alpha: 1)
    }

    func testLighten() {
        expect(self.colors.namedGreen.darken(0.5).lighten(0.5)) == Color(red: 0, green: 0.75, blue: 0, alpha: 1)
        expect(self.colors.rgbGreen.darken(0.5).lighten(0.5)) == Color(red: 0, green: 0.75, blue: 0, alpha: 1)
        expect(self.colors.hsbGreen.darken(0.5).lighten(0.5)) == Color(hue: 0.333, saturation: 1, brightness: 0.75, alpha: 1)

        // do not overflow
        expect(self.colors.namedGreen.lighten(0.5)) == Color(red: 0, green: 1, blue: 0, alpha: 1)
        expect(self.colors.rgbGreen.lighten(0.5)) == Color(red: 0, green: 1, blue: 0, alpha: 1)
        expect(self.colors.hsbGreen.lighten(0.5)) == Color(hue: 0.333, saturation: 1, brightness: 1, alpha: 1)
    }

    func testDesaturate() {
        expect(self.colors.namedGreen.desaturate(0.5)) == Color(red: 0.5, green: 1, blue: 0.5, alpha: 1)
        expect(self.colors.rgbGreen.desaturate(0.5)) == Color(red: 0.5, green: 1, blue: 0.5, alpha: 1)
        expect(self.colors.hsbGreen.desaturate(0.5)) == Color(hue: 0.333, saturation: 0.5, brightness: 1, alpha: 1)
    }

    func testSaturate() {
        expect(self.colors.namedGreen.desaturate(0.5).saturate(0.5)) == Color(red: 0.25, green: 1, blue: 0.25, alpha: 1)
        expect(self.colors.rgbGreen.desaturate(0.5).saturate(0.5)) == Color(red: 0.25, green: 1, blue: 0.25, alpha: 1)
        expect(self.colors.hsbGreen.desaturate(0.5).saturate(0.5)) == Color(hue: 0.333, saturation: 0.75, brightness: 1, alpha: 1)

        // do not overflow
        expect(self.colors.namedGreen.saturate(0.5)) == colors.namedGreen
        expect(self.colors.rgbGreen.saturate(0.5)) == colors.rgbGreen
        expect(self.colors.hsbGreen.saturate(0.5)) == colors.hsbGreen
    }

    static var allTests = [
        ("testVisualBrightness", testVisualBrightness),
        ("testWithBrightnessComponent", testWithBrightnessComponent),
        ("testWithSaturationComponent", testWithSaturationComponent),
        ("testWithHueComponent", testWithHueComponent),
        ("testDarken", testDarken),
        ("testLighten", testLighten),
        ("testDesaturate", testDesaturate),
        ("testSaturate", testSaturate),
    ]
}
