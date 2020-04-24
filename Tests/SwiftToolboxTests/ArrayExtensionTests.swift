//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class ArrayExtensionTests: XCTestCase {
    func testRemoveObject() {
        var array = ["ABC", "DEF", "GHI"]
        array.remove("DEF")
        XCTAssertEqual(array, ["ABC", "GHI"])
    }

    func testUniqueElements() {
        let array = ["ABC", "DEF", "GHI", "DEF"]
        XCTAssertEqual(array.uniqueElements(), ["ABC", "DEF", "GHI"])
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

    func testCommonPrefix() {
        XCTAssertEqual(["A", "b", "C"].commonPrefix(with: ["A", "B", "C"]), ["A"])
        XCTAssertEqual(["A", "B", "C"].commonPrefix(with: ["A", "B", "C"]), ["A", "B", "C"])
        XCTAssertEqual(["A", "B", "C", "d"].commonPrefix(with: ["A", "B", "C"]), ["A", "B", "C"])
        XCTAssertEqual(["a", "B", "C", "D"].commonPrefix(with: ["A", "B", "C"]), [])
        XCTAssertEqual(["A"].commonPrefix(with: ["A", "B", "C"]), ["A"])
        XCTAssertEqual(Array([].commonPrefix(with: ["A", "B", "C"])), [])
    }

    func testCommonSuffix() {
        XCTAssertEqual(["A", "b", "C"].commonSuffix(with: ["A", "B", "C"]), ["C"])
        XCTAssertEqual(["A", "B", "C"].commonSuffix(with: ["A", "B", "C"]), ["A", "B", "C"])
        XCTAssertEqual(["z", "A", "B", "C"].commonSuffix(with: ["A", "B", "C"]), ["A", "B", "C"])
        XCTAssertEqual(["a", "B", "C", "D"].commonSuffix(with: ["A", "B", "C"]), [])
        XCTAssertEqual(["C"].commonSuffix(with: ["A", "B", "C"]), ["C"])
        XCTAssertEqual(Array([].commonSuffix(with: ["A", "B", "C"])), [])
    }

    func testLeastCommonSlice() {
        XCTAssertEqual(["Bla", ".", "Bla", ".", "Bla", ".", "Bla", ".", "Bla", "."].leastCommonSlice, ["Bla", "."])
        XCTAssertNil(["Bla", ".", "Bla", ".", "Bla", ".", "Bla", ".", "Bla", "X"].leastCommonSlice)
        XCTAssertEqual(["Bla", "Bla"].leastCommonSlice, ["Bla"])
        XCTAssertNil(["Bla"].leastCommonSlice)
    }

    func testFindSlice() {
        XCTAssertEqual(["A", "B", "A", "A", "C"].indices(of: ["A"]), [0, 2, 3])
        XCTAssertEqual(["A", "B", "A", "A", "B", "C"].indices(of: ["A", "B"]), [0, 3])
        XCTAssertEqual(["A", "B", "A", "B", "A", "C"].indices(of: ["A", "B", "A"]), [0])
        XCTAssertEqual(["Hello", "World", "Hello"].indices(of: ["Hello"]), [0, 2])
        XCTAssertEqual(["Hello", "World", "Hello"].indices(of: ["hello"]), [])
    }

    func testReplaceSlice() {
        XCTAssertEqual(["A", "B", "A", "A", "C"].replacing(["A"], with: ["D"]), ["D", "B", "D", "D", "C"])
        XCTAssertEqual(["A", "B", "C", "A"].replacing(["A"], with: ["D", "E"]), ["D", "E", "B", "C", "D", "E"])
        XCTAssertEqual(["A", "B", "C", "A", "B"].replacing(["A", "B"], with: ["D"]), ["D", "C", "D"])
        XCTAssertEqual(["A", "B", "C"].replacing(["Q"], with: ["R"]), ["A", "B", "C"])
        XCTAssertEqual(["A", "B", "C"].replacing(["B"], with: ["A", "B"]), ["A", "A", "B", "C"])
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
        ("testUniqueElements", testUniqueElements),
        ("testRemoveDuplicateElements", testRemoveDuplicateElements),
        ("testIntersection", testIntersection),
        ("testCommonPrefix", testCommonPrefix),
        ("testCommonSuffix", testCommonSuffix),
        ("testLeastCommonSlice", testLeastCommonSlice),
        ("testFindSlice", testFindSlice),
        ("testFilterByPredicate", testFilterByPredicate),
    ]
}
