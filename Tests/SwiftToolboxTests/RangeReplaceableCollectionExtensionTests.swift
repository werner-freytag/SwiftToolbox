//
//  Copyright © Werner Freytag. All rights reserved.
//

@testable import SwiftToolbox
import XCTest

class RangeReplaceableCollectionExtensionTests: XCTestCase {
    func testReplacing() {
        XCTAssertEqual(["A", "B", "A", "A", "C"].replacing(["A"], with: ["D"]), ["D", "B", "D", "D", "C"])
        XCTAssertEqual(["A", "B", "C", "A"].replacing(["A"], with: ["D", "E"]), ["D", "E", "B", "C", "D", "E"])
        XCTAssertEqual(["A", "B", "C", "A", "B"].replacing(["A", "B"], with: ["D"]), ["D", "C", "D"])
        XCTAssertEqual(["A", "B", "C"].replacing(["Q"], with: ["R"]), ["A", "B", "C"])
        XCTAssertEqual(["A", "B", "C"].replacing(["B"], with: ["A", "B"]), ["A", "A", "B", "C"])
        XCTAssertEqual(["A", "A"].replacing(["A"], with: []), [])
    }

    func testReplacingSliceInSlice() {
        let array = ["A", "B", "B", "C"]
        let slice = array[1 ..< 3] // ["B", "B"]
        XCTAssertEqual(slice.replacing(["B"], with: []), [])
    }

    func testReplacingInString() {
        XCTAssertEqual("ABAAC".replacing("A", with: "D"), "DBDDC")
        XCTAssertEqual("ABCA".replacing("A", with: "DE"), "DEBCDE")
        XCTAssertEqual("ABCAB".replacing("AB", with: "D"), "DCD")
        XCTAssertEqual("ABC".replacing("Q", with: "R"), "ABC")
        XCTAssertEqual("ABC".replacing("B", with: "AB"), "AABC")
        XCTAssertEqual("AA".replacing("A", with: ""), "")
    }

    func testMovingRange() {
        let string = "HelloWorld"

        // Move to end
        XCTAssertEqual("WorldHello", string.moving(range: string.startIndex ..< string.index(string.startIndex, offsetBy: 5), to: string.endIndex))

        // Move right
        XCTAssertEqual("WHelloorld", string.moving(range: string.startIndex ..< string.index(string.startIndex, offsetBy: 5), to: string.index(string.startIndex, offsetBy: 6)))

        // Move right inside range
        XCTAssertEqual("HelloWorld", string.moving(range: string.startIndex ..< string.index(string.startIndex, offsetBy: 5), to: string.index(after: string.startIndex)))

        // Move to start
        XCTAssertEqual("WorldHello", string.moving(range: string.index(string.endIndex, offsetBy: -5) ..< string.endIndex, to: string.startIndex))

        // Move left
        XCTAssertEqual("HellWorldo", string.moving(range: string.index(string.endIndex, offsetBy: -5) ..< string.endIndex, to: string.index(string.endIndex, offsetBy: -6)))

        // Move left inside range
        XCTAssertEqual("HelloWorld", string.moving(range: string.index(string.endIndex, offsetBy: -5) ..< string.endIndex, to: string.index(string.endIndex, offsetBy: -4)))
    }

    func testReplacingRange() {
        let string = "HelloWorld"

        // Replace
        XCTAssertEqual("HelloEverybody", string.replacing(range: string.index(string.startIndex, offsetBy: 5) ..< string.endIndex, with: "Everybody"))

        // Insert
        XCTAssertEqual("HelloBeautifulWorld", string.replacing(range: string.index(string.startIndex, offsetBy: 5) ..< string.index(string.startIndex, offsetBy: 5), with: "Beautiful"))
    }

    static var allTests = [
        ("testReplacing", testReplacing),
        ("testReplacingSliceInSlice", testReplacingSliceInSlice),
        ("testReplacingInString", testReplacingInString),
        ("testMovingRange", testMovingRange),
        ("testReplacingRange", testReplacingRange),
    ]
}
