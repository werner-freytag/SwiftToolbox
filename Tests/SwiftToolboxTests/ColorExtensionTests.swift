//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

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
        XCTAssertEqual(colors.white.visualBrightness, 1)

        #if os(iOS) // iOS and Mac have different color specs
            XCTAssertEqual(colors.namedGreen.visualBrightness, 0.587)
            XCTAssertEqual(colors.rgbGreen.visualBrightness, 0.587)
            XCTAssertEqual(colors.hsbGreen.visualBrightness, 0.587598)

            XCTAssertEqual(colors.black.visualBrightness, 0)
            XCTAssertEqual(colors.namedRed.visualBrightness, 0.299)
            XCTAssertEqual(colors.rgbRed.visualBrightness, 0.299)
            XCTAssertEqual(colors.hsbRed.visualBrightness, 0.299)

            XCTAssertEqual(colors.namedBlue.visualBrightness, 0.114)
            XCTAssertEqual(colors.rgbBlue.visualBrightness, 0.114)
            XCTAssertEqual(colors.hsbBlue.visualBrightness, 0.11634799999999974)

            XCTAssertEqual(colors.namedGrayWithAlpha.visualBrightness, 0.5)
            XCTAssertEqual(colors.rgbGrayWithAlpha.visualBrightness, 0.5)
            XCTAssertEqual(colors.hsbGrayWithAlpha.visualBrightness, 0.5)
        #endif
    }

    #if os(macOS)
        func testInitRgb() {
            XCTAssertEqual(Color(red: 0, green: 0.5, blue: 1, alpha: 0.75), Color(srgbRed: 0, green: 0.5, blue: 1, alpha: 0.75))
        }
    #endif

    func testWithBrightnessComponent() {
        XCTAssertEqual(colors.namedGreen.withBrightnessComponent(0.5), Color(red: 0, green: 0.5, blue: 0, alpha: 1))
        XCTAssertEqual(colors.rgbGreen.withBrightnessComponent(0.5), Color(red: 0, green: 0.5, blue: 0, alpha: 1))
        XCTAssertEqual(colors.hsbGreen.withBrightnessComponent(0.5), Color(hue: 0.333, saturation: 1, brightness: 0.5, alpha: 1))
    }

    func testWithSaturationComponent() {
        XCTAssertEqual(colors.namedGreen.withSaturationComponent(0.5), Color(red: 0.5, green: 1, blue: 0.5, alpha: 1))
        XCTAssertEqual(colors.rgbGreen.withSaturationComponent(0.5), Color(red: 0.5, green: 1, blue: 0.5, alpha: 1))
        XCTAssertEqual(colors.hsbGreen.withSaturationComponent(0.5), Color(hue: 0.333, saturation: 0.5, brightness: 1, alpha: 1))
    }

    func testWithHueComponent() {
        XCTAssertEqual(colors.namedGreen.withHueComponent(0), Color(red: 1, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(colors.rgbGreen.withHueComponent(0), Color(red: 1, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(colors.hsbGreen.withHueComponent(0), Color(hue: 0, saturation: 1, brightness: 1, alpha: 1))
    }

    func testDarken() {
        XCTAssertEqual(colors.namedGreen.darken(0.5), Color(red: 0, green: 0.5, blue: 0, alpha: 1))
        XCTAssertEqual(colors.rgbGreen.darken(0.5), Color(red: 0, green: 0.5, blue: 0, alpha: 1))
        XCTAssertEqual(colors.hsbGreen.darken(0.5), Color(hue: 0.333, saturation: 1, brightness: 0.5, alpha: 1))

        // There is no blacker than black
        XCTAssertEqual(Color(red: 0, green: 0, blue: 0, alpha: 1).darken(0.5), Color(red: 0, green: 0, blue: 0, alpha: 1))
    }

    func testLighten() {
        XCTAssertEqual(colors.namedGreen.darken(0.5).lighten(0.5), Color(red: 0, green: 0.75, blue: 0, alpha: 1))
        XCTAssertEqual(colors.rgbGreen.darken(0.5).lighten(0.5), Color(red: 0, green: 0.75, blue: 0, alpha: 1))
        XCTAssertEqual(colors.hsbGreen.darken(0.5).lighten(0.5), Color(hue: 0.333, saturation: 1, brightness: 0.75, alpha: 1))

        // do not overflow
        XCTAssertEqual(colors.namedGreen.lighten(0.5), Color(red: 0, green: 1, blue: 0, alpha: 1))
        XCTAssertEqual(colors.rgbGreen.lighten(0.5), Color(red: 0, green: 1, blue: 0, alpha: 1))
        XCTAssertEqual(colors.hsbGreen.lighten(0.5), Color(hue: 0.333, saturation: 1, brightness: 1, alpha: 1))
    }

    func testDesaturate() {
        XCTAssertEqual(colors.namedGreen.desaturate(0.5), Color(red: 0.5, green: 1, blue: 0.5, alpha: 1))
        XCTAssertEqual(colors.rgbGreen.desaturate(0.5), Color(red: 0.5, green: 1, blue: 0.5, alpha: 1))
        XCTAssertEqual(colors.hsbGreen.desaturate(0.5), Color(hue: 0.333, saturation: 0.5, brightness: 1, alpha: 1))
    }

    func testSaturate() {
        XCTAssertEqual(colors.namedGreen.desaturate(0.5).saturate(0.5), Color(red: 0.25, green: 1, blue: 0.25, alpha: 1))
        XCTAssertEqual(colors.rgbGreen.desaturate(0.5).saturate(0.5), Color(red: 0.25, green: 1, blue: 0.25, alpha: 1))
        XCTAssertEqual(colors.hsbGreen.desaturate(0.5).saturate(0.5), Color(hue: 0.333, saturation: 0.75, brightness: 1, alpha: 1))

        // do not overflow
        XCTAssertEqual(colors.namedGreen.saturate(0.5), colors.namedGreen)
        XCTAssertEqual(colors.rgbGreen.saturate(0.5), colors.rgbGreen)
        XCTAssertEqual(colors.hsbGreen.saturate(0.5), colors.hsbGreen)
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
