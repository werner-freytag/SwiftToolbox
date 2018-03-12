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
    
    func testCamelcased() {
        expect("hello world".camelcased()) == "HelloWorld"
        expect("hello-world".camelcased()) == "HelloWorld"
        expect("helloWorld".camelcased()) == "HelloWorld"
        expect("äntonÖrtel".camelcased()) == "ÄntonÖrtel"
        expect("123test".camelcased()) == "123Test"
        expect("ÄntónÖrtel".camelcased()) == "ÄntónÖrtel"
    }
}
