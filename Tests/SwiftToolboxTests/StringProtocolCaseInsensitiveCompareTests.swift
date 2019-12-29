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
        XCTAssertEqual("Hello_".match(against: "hello"), 0.8333333)
        XCTAssertEqual("H_ello".match(against: "hello"), 0.5) // Earlier matches rank better
        XCTAssertEqual("_Hello".match(against: "hello"), 0.41666666)
        XCTAssertEqual("__Hello".match(against: "hello"), 0.23809525)

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
    }

    static var allTests = [
        ("testCompareEquals", testCompareEquals),
        ("testCompareLessThan", testCompareLessThan),
        ("testMatchAgainst", testMatchAgainst),
    ]
}
