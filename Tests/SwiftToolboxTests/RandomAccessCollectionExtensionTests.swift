//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class RandomAccessCollectionExtensionTests: XCTestCase {
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
        XCTAssertEqual(["A", "B", "A", "A", "C"].ranges(matching: ["A"]), [0 ..< 1, 2 ..< 3, 3 ..< 4])
        XCTAssertEqual(["A", "B", "A", "A", "B", "C"].ranges(matching: ["A", "B"]), [0 ..< 2, 3 ..< 5])
        XCTAssertEqual(["A", "B", "A", "B", "A", "C"].ranges(matching: ["A", "B", "A"]), [0 ..< 3])
        XCTAssertEqual(["Hello", "World", "Hello"].ranges(matching: ["Hello"]), [0 ..< 1, 2 ..< 3])
        XCTAssertEqual(["Hello", "World", "Hello"].ranges(matching: ["hello"]), [])
    }

    func testReplaceSlice() {
        XCTAssertEqual(["A", "B", "A", "A", "C"].replacingOccurrences(of: ["A"], with: ["D"]), ["D", "B", "D", "D", "C"])
        XCTAssertEqual(["A", "B", "C", "A"].replacingOccurrences(of: ["A"], with: ["D", "E"]), ["D", "E", "B", "C", "D", "E"])
        XCTAssertEqual(["A", "B", "C", "A", "B"].replacingOccurrences(of: ["A", "B"], with: ["D"]), ["D", "C", "D"])
        XCTAssertEqual(["A", "B", "C"].replacingOccurrences(of: ["Q"], with: ["R"]), ["A", "B", "C"])
        XCTAssertEqual(["A", "B", "C"].replacingOccurrences(of: ["B"], with: ["A", "B"]), ["A", "A", "B", "C"])
    }

    static var allTests = [
        ("testCommonPrefix", testCommonPrefix),
        ("testCommonSuffix", testCommonSuffix),
        ("testLeastCommonSlice", testLeastCommonSlice),
        ("testFindSlice", testFindSlice),
    ]
}
