//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Nimble
import SwiftToolbox
import XCTest

class ArrayExtensionTest: XCTestCase {
	func testRemoveObject() {
		var array = ["ABC", "DEF", "GHI"]
		array.remove("DEF")
		expect(array).to(equal(["ABC", "GHI"]))
	}

	func testUniqueElements() {
		let array = ["ABC", "DEF", "GHI", "DEF"]
		expect(array.uniqueElements).to(equal(["ABC", "DEF", "GHI"]))
	}
	
	func testRemoveDuplicateElements() {
		var array = ["ABC", "DEF", "GHI", "DEF"]
		array.removeDuplicateElements()
		expect(array).to(equal(["ABC", "DEF", "GHI"]))
	}
	
	func testIntersection() {
		let array = ["ABC", "DEF", "GHI"]
		expect(array.intersection(["GHI", "ABC"])).to(equal(["ABC", "GHI"]))
	}
}
