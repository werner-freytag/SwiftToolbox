//
//  UIColor+Extension.swift
//

import Foundation

extension UIColor {
	var visualBrightness:CGFloat {
		let componentColors = CGColorGetComponents(CGColor)
		return ((componentColors[0] * 299) + (componentColors[1] * 587) + (componentColors[2] * 114)) / 1000
	}
}
