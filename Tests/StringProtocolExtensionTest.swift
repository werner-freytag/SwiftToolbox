//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

class StringProtocolExtensionTest: XCTestCase {
    func testSubscripts() {
        expect("Hello"[2...]) == "llo"
        expect("Hello"[2..<3]) == "l"
        expect("Hello"[2...3]) == "ll"
        expect("Hello"[..<3]) == "Hel"
        expect("Hello"[...3]) == "Hell"
        expect("Hello"[0]) == "H"
        expect("Hello"[3]) == "l"
    }
    
    func testCommonSuffix() {
        expect("Hello World".commonSuffix(with: "Other World")) == " World"
        expect("Hello World".commonSuffix(with: "No matching")) == ""
        expect("".commonSuffix(with: "Other World")) == ""
        
        expect("Hello World".commonSuffix(with: "Other world")) == "orld"
        expect("Hello World".commonSuffix(with: "Other world", options: [.caseInsensitive])) == " World"
    }
    
    func testFindWords() {
        expect("MünchenBavaria1980Ørt".findWords()) == ["München", "Bavaria", "1980", "Ørt"]
        expect("with.dots.between1997".findWords()) == ["with", "dots", "between", "1997"]
        expect("under_scored_text".findWords()) == ["under", "scored", "text"]
        expect("With Spaces  2008".findWords()) == ["With", "Spaces", "2008"]
    }
    
    func testUpperCamelCased() {
        expect("hello world".upperCamelCased()) == "HelloWorld"
        expect("hello-world".upperCamelCased()) == "HelloWorld"
        expect("helloWorld".upperCamelCased()) == "HelloWorld"
        expect("äntonÖrtel".upperCamelCased()) == "ÄntonÖrtel"
        expect("änton örtel".upperCamelCased()) == "ÄntonÖrtel"
        expect("123test".upperCamelCased()) == "123Test"
        expect("ÄntónÖrtel".upperCamelCased()) == "ÄntónÖrtel"
        expect("camel case".upperCamelCased()) == "CamelCase"
        expect("CAMEL CASE".upperCamelCased()) == "CamelCase"
        expect("Camel-Case-1997".upperCamelCased()) == "CamelCase1997"
        expect("_camel_case".upperCamelCased()) == "CamelCase"
    }
    
    func testRegexQuoted() {
        expect("[]()\\*+?{}.|^$".regexQuoted()) == "\\[\\]\\(\\)\\\\\\*\\+\\?\\{\\}\\.\\|\\^\\$"
        expect("a[b]c(d)e{f}".regexQuoted()) == "a\\[b\\]c\\(d\\)e\\{f\\}"
    }
    
    func testSubstringsMatching() {
        expect("Hello".substrings(matching: ".[eo]")) == ["He", "lo"]
    }
}
