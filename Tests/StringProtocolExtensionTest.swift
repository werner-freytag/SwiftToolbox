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
        expect("Lorem ipsum dolor sit amet, consetetur sadipscing elitr.".findWords()) == ["Lorem", "ipsum", "dolor", "sit", "amet", "consetetur", "sadipscing", "elitr"]
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
        expect("Hello".substrings(matching: ".*?")) == ["", "", "", "", "", ""]
    }
    
    func testPathExtension() {
        // Different cases
        expect("Name.gif".pathExtension) == "gif"
        expect("Name.GIF".pathExtension) == "GIF"
        expect("Name.Gif".pathExtension) == "Gif"
        expect("Name.giF".pathExtension) == "giF"
        expect("Name._GIF".pathExtension) == "_GIF"

        // Longer extension
        expect("Name.fileExt".pathExtension) == "fileExt"
        expect("Name.FILEEXT".pathExtension) == "FILEEXT"
        expect("Name.FileExt".pathExtension) == "FileExt"
        
        // Max 20 Chars in last Extension
        expect("Name.VeryLongpathExtension".pathExtension) == ""
        
        // Double extension
        expect("Name.html.twig".pathExtension) == "html.twig"
        
        // No camel case in 2nd extension
        expect("Mr.Smith.txt".pathExtension) == "txt"
        
        // No Space in 2nd extension
        expect("Mr. smith.txt".pathExtension) == "txt"

        // Max 10 Chars in 2nd Extension
        expect("Name.pathExtensionTest.jpg".pathExtension) == "jpg"
        
        // No tripple extension
        expect("Name.test.html.twig".pathExtension) == "html.twig"

        // No extension
        expect("Name".pathExtension) == ""
        // Only a-z0-9 and _
        expect("Name.nö".pathExtension) == ""
        expect("Name.-TXT".pathExtension) == ""
        
        // Not complete string
        expect(".scratch.tiff".pathExtension) == "tiff"
        expect(".scratch".pathExtension) == ""
        
        // Ignore duplicate dot
        expect("scratch..tiff".pathExtension) == "tiff"
    }
}
