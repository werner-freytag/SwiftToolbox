//
//  Copyright © Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class ArrayExtensionTests: XCTestCase {
    func testRemoveObject() {
        var array = ["ABC", "DEF", "GHI"]
        array.remove("DEF")
        XCTAssertEqual(array, ["ABC", "GHI"])
    }

    func testRemoveDuplicateElements() {
        var array = ["ABC", "DEF", "GHI", "DEF"]
        array.removeDuplicateElements()
        XCTAssertEqual(array, ["ABC", "DEF", "GHI"])
    }

    func testIntersection() {
        let array = ["ABC", "DEF", "GHI"]
        XCTAssertEqual(array.intersection(["GHI", "ABC"]), ["ABC", "GHI"])
    }

    func testSubtract() {
        XCTAssertEqual([1, 2, 3] - [2], [1, 3])

        var array = [1, 2, 3]
        array -= [2]
        XCTAssertEqual(array, [1, 3])
    }

    func testFilterByPredicate() {
        let strings: [NSString] = ["Apple", "Banana", "Cherry", "Dewberries"]
        XCTAssertEqual(strings.filter(NSPredicate(format: "self CONTAINS %@", "err")), ["Cherry", "Dewberries"])
    }

    static var allTests = [
        ("testRemoveObject", testRemoveObject),
        ("testRemoveDuplicateElements", testRemoveDuplicateElements),
        ("testIntersection", testIntersection),
        ("testFilterByPredicate", testFilterByPredicate),
    ]
}
