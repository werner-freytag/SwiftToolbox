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
}
