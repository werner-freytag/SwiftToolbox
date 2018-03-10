//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

class StringRegexTest : XCTestCase {
    func testRegexQuoted() {
        expect("[]()\\*+?{}.|^$".regexQuoted()) == "\\[\\]\\(\\)\\\\\\*\\+\\?\\{\\}\\.\\|\\^\\$"
        expect("a[b]c(d)e{f}".regexQuoted()) == "a\\[b\\]c\\(d\\)e\\{f\\}"
    }

    func testMatchRegex() {
        expect(try! "Hello".match(regex: "l+")) == ["ll"]
        expect(try! "Hello".match(regex: "(l+)")) == ["ll", "ll"]
        expect(try? "Hello".match(regex: "(^l+")).to(beNil())
        expect(try! "Hello".match(regex: "^(l+)")).to(beNil())
        expect(try! "Hello".match(regex: "^H(e)(l+)")) == ["Hell", "e", "ll"]
    }
    
    func testSubstringsMatching() {
        expect("Hello".substrings(matching: ".[eo]")) == ["He", "lo"]
    }
}
