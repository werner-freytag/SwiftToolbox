//
//  UIColor+Extension.swift
//  News
//
//  Created by Werner Freytag on 26.04.16.
//  Copyright © 2016 SPORT1 GmbH. All rights reserved.
//

import Foundation

extension UIColor {
	var visualBrightness:CGFloat {
		let componentColors = CGColorGetComponents(CGColor)
		return ((componentColors[0] * 299) + (componentColors[1] * 587) + (componentColors[2] * 114)) / 1000
	}
}