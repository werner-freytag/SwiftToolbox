//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

#if os(OSX)
    import AppKit.NSColor
    fileprivate typealias Color = NSColor
#else
    import UIKit.UIColor
    fileprivate typealias Color = UIColor
#endif

#if os(macOS)
    extension Color {
        public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            self.init(srgbRed: red, green: green, blue: blue, alpha: alpha)
        }
    }
#endif

class ColorExtensionTests : XCTestCase {
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
}
