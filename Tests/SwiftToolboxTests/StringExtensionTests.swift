//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class StringExtensionTests: XCTestCase {
    func testTrimming() {
        XCTAssertEqual("Hello".trimmed, "Hello")
        XCTAssertEqual("Hello     ".trimmed, "Hello")
        XCTAssertEqual("   Hello     ".trimmed, "Hello")
        XCTAssertEqual(" Hello \n".trimmed, "Hello")
        XCTAssertEqual("\t   Hello \n".trimmed, "Hello")
        XCTAssertEqual("  \n\t   Hello \n\r \t ".trimmed, "Hello")
    }

    func testContains() {
        XCTAssertTrue("Hello".contains("Hell"))
        XCTAssertFalse("Hello".contains("Hi"))
    }

    func testMatchRegex() {
        XCTAssertEqual(try! "Hello".match(regex: "l+"), ["ll"])
        XCTAssertEqual(try! "Hello".match(regex: "(l+)"), ["ll", "ll"])
        XCTAssertNil(try? "Hello".match(regex: "(^l+"))
        XCTAssertNil(try! "Hello".match(regex: "^(l+)"))
        XCTAssertEqual(try! "Hello".match(regex: "^H(e)(l+)"), ["Hell", "e", "ll"])
        XCTAssertEqual(try! "Hello".match(regex: "^H(i)?"), ["H", ""])
    }

    static var allTests = [
        ("testTrimming", testTrimming),
        ("testContains", testContains),
        ("testMatchRegex", testMatchRegex),
    ]
}
