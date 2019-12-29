//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class StringProtocolDiffTests: XCTestCase {
    func testDiffBeginning() {
        let str = "Hello"
        let diff = str.diff(with: "hello")!

        XCTAssertEqual(diff.range, str.startIndex ..< str.index(after: str.startIndex))
        XCTAssertEqual(diff.replacement, "h")
        XCTAssertEqual(diff.overlap, 0)
    }

    func testDiffMiddleOverlapping() {
        let str = "Hello world"
        let diff = str.diff(with: "Hello crazy world")!

        XCTAssertEqual(diff.range, str.index(str.startIndex, offsetBy: 5) ..< str.index(str.startIndex, offsetBy: 6))
        XCTAssertEqual(diff.replacement, " crazy ")
        XCTAssertEqual(diff.overlap, 1)
    }

    func testDiffMiddleRemoving() {
        let str = "Hello crazy world"
        let diff = str.diff(with: "Hello world")!

        XCTAssertEqual(diff.range, str.index(str.startIndex, offsetBy: 5) ..< str.index(str.startIndex, offsetBy: 12))
        XCTAssertEqual(diff.replacement, " ")
        XCTAssertEqual(diff.overlap, 1)
    }

    func testAsymetricOverlap() {
        let str = "Hello  world"
        let diff = str.diff(with: "Hello  crazy world")!

        XCTAssertEqual(diff.range, str.index(str.startIndex, offsetBy: 6) ..< str.index(str.startIndex, offsetBy: 7))
        XCTAssertEqual(diff.replacement, " crazy ")
        XCTAssertEqual(diff.overlap, 1)
    }

    func testTwoCharsOverlap() {
        let str = "Hello  world"
        let diff = str.diff(with: "Hello  crazy  world")!

        XCTAssertEqual(diff.range, str.index(str.startIndex, offsetBy: 5) ..< str.index(str.startIndex, offsetBy: 7))
        XCTAssertEqual(diff.replacement, "  crazy  ")
        XCTAssertEqual(diff.overlap, 2)
    }

    func testNoMatch() {
        let str = "Hello world"
        let diff = str.diff(with: "Hello world")

        XCTAssertNil(diff)
    }

    static var allTests = [
        ("testDiffBeginning", testDiffBeginning),
        ("testDiffMiddleOverlapping", testDiffMiddleOverlapping),
        ("testDiffMiddleRemoving", testDiffMiddleRemoving),
        ("testTwoCharsOverlap", testTwoCharsOverlap),
        ("testNoMatch", testNoMatch),
    ]
}
