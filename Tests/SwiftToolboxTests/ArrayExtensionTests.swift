//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Nimble
import SwiftToolbox
import XCTest

class ArrayExtensionTests: XCTestCase {
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

    func testLeastCommonSlice() {
        expect(["Bla", ".", "Bla", ".", "Bla", ".", "Bla", ".", "Bla", "."].leastCommonSlice) == ["Bla", "."]
        expect(["Bla", ".", "Bla", ".", "Bla", ".", "Bla", ".", "Bla", "X"].leastCommonSlice).to(beNil())
        expect(["Bla", "Bla"].leastCommonSlice) == ["Bla"]
        expect(["Bla"].leastCommonSlice).to(beNil())
    }

    func testFindSlice() {
        expect(["A", "B", "A", "A", "C"].find(slice: ["A"])) == [0, 2, 3]
        expect(["A", "B", "A", "A", "B", "C"].find(slice: ["A", "B"])) == [0, 3]
        expect(["Hello", "World", "Hello"].find(slice: ["Hello"])) == [0, 2]
        expect(["Hello", "World", "Hello"].find(slice: ["hello"])) == []
    }

    func testSubtract() {
        expect([1, 2, 3] - [2]) == [1, 3]

        var array = [1, 2, 3]
        array -= [2]
        expect(array) == [1, 3]
    }

    func testFilterByPredicate() {
        let strings: [NSString] = ["Apple", "Banana", "Cherry", "Dewberries"]
        expect(strings.filter(NSPredicate(format: "self CONTAINS %@", "err"))) == ["Cherry", "Dewberries"]
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
