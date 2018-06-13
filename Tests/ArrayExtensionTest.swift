//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

class ArrayExtensionTest: XCTestCase {
	func testRemoveObject() {
		var array = ["ABC", "DEF", "GHI"]
		array.remove("DEF")
		expect(array) == ["ABC", "GHI"]
	}

	func testUniqueElements() {
		let array = ["ABC", "DEF", "GHI", "DEF"]
		expect(array.uniqueElements()) == ["ABC", "DEF", "GHI"]
	}
	
	func testRemoveDuplicateElements() {
		var array = ["ABC", "DEF", "GHI", "DEF"]
		array.removeDuplicateElements()
		expect(array) == ["ABC", "DEF", "GHI"]
	}
	
	func testIntersection() {
		let array = ["ABC", "DEF", "GHI"]
		expect(array.intersection(["GHI", "ABC"])) == ["ABC", "GHI"]
	}
    
    func testCommonPrefix() {
        expect(["A", "b", "C"].commonPrefix(with: ["A", "B", "C"])) == ["A"]
        expect(["A", "B", "C"].commonPrefix(with: ["A", "B", "C"])) == ["A", "B", "C"]
        expect(["A", "B", "C", "d"].commonPrefix(with: ["A", "B", "C"])) == ["A", "B", "C"]
        expect(["a", "B", "C", "D"].commonPrefix(with: ["A", "B", "C"])) == []
        expect(["A"].commonPrefix(with: ["A", "B", "C"])) == ["A"]
        expect(Array([].commonPrefix(with: ["A", "B", "C"]))) == []
    }

    func testCommonSuffix() {
        expect(["A", "b", "C"].commonSuffix(with: ["A", "B", "C"])) == ["C"]
        expect(["A", "B", "C"].commonSuffix(with: ["A", "B", "C"])) == ["A", "B", "C"]
        expect(["z", "A", "B", "C"].commonSuffix(with: ["A", "B", "C"])) == ["A", "B", "C"]
        expect(["a", "B", "C", "D"].commonSuffix(with: ["A", "B", "C"])) == []
        expect(["C"].commonSuffix(with: ["A", "B", "C"])) == ["C"]
        expect(Array([].commonSuffix(with: ["A", "B", "C"]))) == []
    }
}
