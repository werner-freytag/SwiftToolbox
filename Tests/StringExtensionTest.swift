//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

class StringExtensionTest: XCTestCase {
    func testTrimming() {
        expect("Hello".trimmed) == "Hello"
        expect("Hello     ".trimmed) == "Hello"
        expect("   Hello     ".trimmed) == "Hello"
        expect(" Hello \n".trimmed) == "Hello"
        expect("\t   Hello \n".trimmed) == "Hello"
        expect("  \n\t   Hello \n\r \t ".trimmed) == "Hello"
    }

    func testMatchRegex() {
        expect(try! "Hello".match(regex: "l+")) == ["ll"]
        expect(try! "Hello".match(regex: "(l+)")) == ["ll", "ll"]
        expect(try? "Hello".match(regex: "(^l+")).to(beNil())
        expect(try! "Hello".match(regex: "^(l+)")).to(beNil())
        expect(try! "Hello".match(regex: "^H(e)(l+)")) == ["Hell", "e", "ll"]
    }
}
