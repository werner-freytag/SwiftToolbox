//
//  UIColorExtensionTest.swift
//  News
//
//  Created by Werner Freytag on 26.04.16.
//  Copyright © 2016 SPORT1 GmbH. All rights reserved.
//

import XCTest
import UIKit

class UIColorExtensionTest: XCTestCase {

    func testVisualBrightness() {
		// Table Colors
		let white = UIColor.whiteColor()
		let lightGray = UIColor(white:0.874510, alpha:1.000000)
		
		let whiteOdd = UIColor(white:0.949020, alpha:1.000000)
		let lightGrayOdd = UIColor(white:0.831373, alpha:1.000000)
		
		// Ranking Colors
		let red = UIColor(red:0.850980, green:0.305882, blue:0.317647, alpha:1.000000)
		let yellow = UIColor(red:0.968627, green:0.909804, blue:0.039216, alpha:1.000000)
		let lightBlue = UIColor(red:0.411765, green:0.552941, blue:0.780392, alpha:1.000000)
		let darkBlue = UIColor(red:0.270588, green:0.403922, blue:0.615686, alpha:1.000000)
		let lightGreen = UIColor(red:0.505882, green:0.737255, blue:0.403922, alpha:1.000000)
		let darkGreen = UIColor(red:0.168627, green:0.400000, blue:0.066667, alpha:1.000000)
		
		let darkColors = [ red, lightBlue, darkBlue, darkGreen ]
		let lightColors = [ white, lightGray, whiteOdd, lightGrayOdd, yellow, lightGreen ]
		
		for color in lightColors {
			XCTAssertGreaterThan( color.visualBrightness, 0.6, "Color \(index)" )
		}
		
		for (index, color) in darkColors.enumerate() {
			XCTAssertLessThan( color.visualBrightness, 0.6, "Color \(index)" )
		}

	}
}
