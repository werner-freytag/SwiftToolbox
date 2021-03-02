//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class StringProtocolCaseInsensitiveCompareTests: XCTestCase {
    func testCompareEquals() {
        XCTAssertEqual("Hello" ~ "hello", true)
        XCTAssertEqual("hello" ~ "Hello", true)
        XCTAssertEqual("hellO" ~ "HellO", true)
        XCTAssertEqual("hellö" ~ "HellO", false)
    }

    func testCompareLessThan() {
        XCTAssertEqual("Hello" ~< "hello", false)
        XCTAssertEqual("hello" ~< "Hello", false)
        XCTAssertEqual("hellO" ~< "HellO", false)
        XCTAssertEqual("hellO 1" ~< "HellO 2", true)
    }

    func testMatchAgainst() {
        XCTAssertEqual("Hello".match(against: "hello"), 1)
        XCTAssertEqual("Hello".match(against: "hello", options: []), 0) // Case sensitive

        XCTAssertNotEqual("Hello_".match(against: "hello"), 0)
        XCTAssertNotEqual("H_ello".match(against: "hello"), 0)
        XCTAssertNotEqual("_Hello".match(against: "hello"), 0)
        XCTAssertNotEqual("__Hello".match(against: "hello"), 0)

        // Earlier matches rank better
        XCTAssertGreaterThan("Hello_".match(against: "hello"), "H_ello".match(against: "hello"))
        XCTAssertGreaterThan("H_ello".match(against: "hello"), "_Hello".match(against: "hello"))
        XCTAssertGreaterThan("_Hello".match(against: "hello"), "__Hello".match(against: "hello"))

        // Special cases: Empty strings
        XCTAssertEqual("".match(against: "hello"), 0)
        XCTAssertEqual("Hello".match(against: ""), 0)
        XCTAssertEqual("".match(against: ""), 1)

        // Search pattern longer than string
        XCTAssertEqual("Hello".match(against: "Hello_"), 0)

        // Earlier matches must rank better
        XCTAssertGreaterThan("Toilett Paper".match(against: "To"), "Potatoes".match(against: "To"))
        XCTAssertGreaterThan("Toothpaste".match(against: "To"), "Potatoes".match(against: "To"))
        XCTAssertGreaterThan("Tomatoes".match(against: "To"), "Potatoes".match(against: "To"))
        XCTAssertGreaterThan("Algifor forte 400".match(against: "a"), "Padma 28".match(against: "a"))
    }

    static var allTests = [
        ("testCompareEquals", testCompareEquals),
        ("testCompareLessThan", testCompareLessThan),
        ("testMatchAgainst", testMatchAgainst),
    ]
}
