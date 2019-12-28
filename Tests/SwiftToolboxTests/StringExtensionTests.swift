//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Nimble
import SwiftToolbox
import XCTest

class StringExtensionTests: XCTestCase {
    func testTrimming() {
        expect("Hello".trimmed) == "Hello"
        expect("Hello     ".trimmed) == "Hello"
        expect("   Hello     ".trimmed) == "Hello"
        expect(" Hello \n".trimmed) == "Hello"
        expect("\t   Hello \n".trimmed) == "Hello"
        expect("  \n\t   Hello \n\r \t ".trimmed) == "Hello"
    }

    func testContains() {
        expect("Hello".contains("Hell")).to(beTrue())
        expect("Hello".contains("Hi")).to(beFalse())
    }

    func testMatchRegex() {
        expect(try! "Hello".match(regex: "l+")) == ["ll"]
        expect(try! "Hello".match(regex: "(l+)")) == ["ll", "ll"]
        expect(try? "Hello".match(regex: "(^l+")).to(beNil())
        expect(try! "Hello".match(regex: "^(l+)")).to(beNil())
        expect(try! "Hello".match(regex: "^H(e)(l+)")) == ["Hell", "e", "ll"]
        expect(try! "Hello".match(regex: "^H(i)?")) == ["H", ""]
    }

    static var allTests = [
        ("testTrimming", testTrimming),
        ("testContains", testContains),
        ("testMatchRegex", testMatchRegex),
    ]
}
