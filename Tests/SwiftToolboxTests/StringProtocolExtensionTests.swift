//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Nimble
@testable import SwiftToolbox
import XCTest

class StringProtocolExtensionTests: XCTestCase {
    func testSubscripts() {
        expect("Hello"[2...]) == "llo"
        expect("Hello"[2 ..< 3]) == "l"
        expect("Hello"[2 ... 3]) == "ll"
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
        expect(Array("Lorem ipsum dolor sit amet, consetetur sadipscing elitr.".findWords())) == ["Lorem", "ipsum", "dolor", "sit", "amet", "consetetur", "sadipscing", "elitr"]
        expect(Array("MünchenBavaria1980Ørt".findWords())) == ["München", "Bavaria", "1980", "Ørt"]
        expect(Array("with.dots.between1997".findWords())) == ["with", "dots", "between", "1997"]
        expect(Array("under_scored_text".findWords())) == ["under", "scored", "text"]
        expect(Array("With Spaces  2008".findWords())) == ["With", "Spaces", "2008"]
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
        expect(Array("Hello".substrings(matching: ".[eo]", options: .regularExpression))) == ["He", "lo"]
        expect(Array("Hello".substrings(matching: ".*?", options: .regularExpression))) == ["", "", "", "", ""]
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
        expect("Name.VeryLongPathExtension".pathExtension) == ""

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

    func testDeletingPathExtension() {
        // Different cases
        expect("Name.gif".deletingPathExtension) == "Name"
        expect("Name.GIF".deletingPathExtension) == "Name"
        expect("Name.Gif".deletingPathExtension) == "Name"
        expect("Name.giF".deletingPathExtension) == "Name"
        expect("Name._GIF".deletingPathExtension) == "Name"

        // Longer extension
        expect("Name.fileExt".deletingPathExtension) == "Name"
        expect("Name.FILEEXT".deletingPathExtension) == "Name"
        expect("Name.FileExt".deletingPathExtension) == "Name"

        // Max 20 Chars in last Extension
        expect("Name.VeryLongPathExtension".deletingPathExtension) == "Name.VeryLongPathExtension"

        // Double extension
        expect("Name.html.twig".deletingPathExtension) == "Name"

        // No camel case in 2nd extension
        expect("Mr.Smith.txt".deletingPathExtension) == "Mr.Smith"

        // No Space in 2nd extension
        expect("Mr. smith.txt".deletingPathExtension) == "Mr. smith"

        // Max 10 Chars in 2nd Extension
        expect("Name.pathExtensionTest.jpg".deletingPathExtension) == "Name.pathExtensionTest"

        // Ending with dot
        expect("Name.jpg.".deletingPathExtension) == "Name"

        // No tripple extension
        expect("Name.test.html.twig".deletingPathExtension) == "Name.test"

        // No extension
        expect("Name".deletingPathExtension) == "Name"

        // Only a-z0-9 and _
        expect("Name.nö".deletingPathExtension) == "Name.nö"
        expect("Name.-TXT".deletingPathExtension) == "Name.-TXT"

        // Not complete string
        expect(".scratch.tiff".deletingPathExtension) == ".scratch"
        expect(".scratch".deletingPathExtension) == ".scratch"

        // Ignore duplicate dot
        expect("scratch..tiff".deletingPathExtension) == "scratch"
    }

    static var allTests = [
        ("testSubscripts", testSubscripts),
        ("testCommonSuffix", testCommonSuffix),
        ("testFindWords", testFindWords),
        ("testUpperCamelCased", testUpperCamelCased),
        ("testRegexQuoted", testRegexQuoted),
        ("testSubstringsMatching", testSubstringsMatching),
        ("testPathExtension", testPathExtension),
        ("testDeletingPathExtension", testDeletingPathExtension),
    ]
}
