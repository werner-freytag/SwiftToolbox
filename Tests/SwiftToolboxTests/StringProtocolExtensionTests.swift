//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class StringProtocolExtensionTests: XCTestCase {
    func testSubscripts() {
        XCTAssertEqual("Hello"[2...], "llo")
        XCTAssertEqual("Hello"[2 ..< 3], "l")
        XCTAssertEqual("Hello"[2 ... 3], "ll")
        XCTAssertEqual("Hello"[..<3], "Hel")
        XCTAssertEqual("Hello"[...3], "Hell")
        XCTAssertEqual("Hello"[0], "H")
        XCTAssertEqual("Hello"[3], "l")
    }

    func testCommonSuffix() {
        XCTAssertEqual("Hello World".commonSuffix(with: "Other World"), " World")
        XCTAssertEqual("Hello World".commonSuffix(with: "No matching"), "")
        XCTAssertEqual("".commonSuffix(with: "Other World"), "")

        XCTAssertEqual("Hello World".commonSuffix(with: "Other world"), "orld")
        XCTAssertEqual("Hello World".commonSuffix(with: "Other world", options: [.caseInsensitive]), " World")
    }

    func testFindWords() {
        XCTAssertEqual(Array("Lorem ipsum dolor sit amet, consetetur sadipscing elitr.".findWords()), ["Lorem", "ipsum", "dolor", "sit", "amet", "consetetur", "sadipscing", "elitr"])
        XCTAssertEqual(Array("MünchenBavaria1980Ørt".findWords()), ["München", "Bavaria", "1980", "Ørt"])
        XCTAssertEqual(Array("with.dots.between1997".findWords()), ["with", "dots", "between", "1997"])
        XCTAssertEqual(Array("under_scored_text".findWords()), ["under", "scored", "text"])
        XCTAssertEqual(Array("With Spaces  2008".findWords()), ["With", "Spaces", "2008"])
    }

    func testUpperCamelCased() {
        XCTAssertEqual("hello world".upperCamelCased(), "HelloWorld")
        XCTAssertEqual("hello-world".upperCamelCased(), "HelloWorld")
        XCTAssertEqual("helloWorld".upperCamelCased(), "HelloWorld")
        XCTAssertEqual("äntonÖrtel".upperCamelCased(), "ÄntonÖrtel")
        XCTAssertEqual("änton örtel".upperCamelCased(), "ÄntonÖrtel")
        XCTAssertEqual("123test".upperCamelCased(), "123Test")
        XCTAssertEqual("ÄntónÖrtel".upperCamelCased(), "ÄntónÖrtel")
        XCTAssertEqual("camel case".upperCamelCased(), "CamelCase")
        XCTAssertEqual("CAMEL CASE".upperCamelCased(), "CamelCase")
        XCTAssertEqual("Camel-Case-1997".upperCamelCased(), "CamelCase1997")
        XCTAssertEqual("_camel_case".upperCamelCased(), "CamelCase")
    }

    func testCapitalizingFirstLetter() {
        XCTAssertEqual("hello".capitalizingFirstLetter, "Hello")
        XCTAssertEqual("helloWorld".capitalizingFirstLetter, "HelloWorld")
        XCTAssertEqual("änton".capitalizingFirstLetter, "Änton")
        XCTAssertEqual("123test".capitalizingFirstLetter, "123test")
        XCTAssertEqual("ÄntónÖrtel".capitalizingFirstLetter, "ÄntónÖrtel")
        XCTAssertEqual("CAMEL".capitalizingFirstLetter, "CAMEL")
        XCTAssertEqual("_camel_case".capitalizingFirstLetter, "_camel_case")
    }

    func testRegexQuoted() {
        XCTAssertEqual("[]()\\*+?{}.|^$".regexQuoted(), "\\[\\]\\(\\)\\\\\\*\\+\\?\\{\\}\\.\\|\\^\\$")
        XCTAssertEqual("a[b]c(d)e{f}".regexQuoted(), "a\\[b\\]c\\(d\\)e\\{f\\}")
    }

    func testSubstringsMatching() {
        XCTAssertEqual(Array("Hello".substrings(of: ".[eo]", options: .regularExpression)), ["He", "lo"])
        XCTAssertEqual(Array("Hello".substrings(of: ".*?", options: .regularExpression)), ["", "", "", "", ""])
    }

    func testPathExtension() {
        // Different cases
        XCTAssertEqual("Name.gif".pathExtension, "gif")
        XCTAssertEqual("Name.GIF".pathExtension, "GIF")
        XCTAssertEqual("Name.Gif".pathExtension, "Gif")
        XCTAssertEqual("Name.giF".pathExtension, "giF")
        XCTAssertEqual("Name._GIF".pathExtension, "_GIF")

        // Longer extension
        XCTAssertEqual("Name.fileExt".pathExtension, "fileExt")
        XCTAssertEqual("Name.FILEEXT".pathExtension, "FILEEXT")
        XCTAssertEqual("Name.FileExt".pathExtension, "FileExt")

        // Max 20 Chars in last Extension
        XCTAssertEqual("Name.VeryLongPathExtension".pathExtension, "")

        // Double extension
        XCTAssertEqual("Name.html.twig".pathExtension, "html.twig")

        // No camel case in 2nd extension
        XCTAssertEqual("Mr.Smith.txt".pathExtension, "txt")

        // No Space in 2nd extension
        XCTAssertEqual("Mr. smith.txt".pathExtension, "txt")

        // Max 10 Chars in 2nd Extension
        XCTAssertEqual("Name.pathExtensionTest.jpg".pathExtension, "jpg")

        // No tripple extension
        XCTAssertEqual("Name.test.html.twig".pathExtension, "html.twig")

        // No extension
        XCTAssertEqual("Name".pathExtension, "")

        // Only a-z0-9 and _
        XCTAssertEqual("Name.nö".pathExtension, "")
        XCTAssertEqual("Name.-TXT".pathExtension, "")

        // Not complete string
        XCTAssertEqual(".scratch.tiff".pathExtension, "tiff")
        XCTAssertEqual(".scratch".pathExtension, "")

        // Ignore duplicate dot
        XCTAssertEqual("scratch..tiff".pathExtension, "tiff")
    }

    func testDeletingPathExtension() {
        // Different cases
        XCTAssertEqual("Name.gif".deletingPathExtension, "Name")
        XCTAssertEqual("Name.GIF".deletingPathExtension, "Name")
        XCTAssertEqual("Name.Gif".deletingPathExtension, "Name")
        XCTAssertEqual("Name.giF".deletingPathExtension, "Name")
        XCTAssertEqual("Name._GIF".deletingPathExtension, "Name")

        // Longer extension
        XCTAssertEqual("Name.fileExt".deletingPathExtension, "Name")
        XCTAssertEqual("Name.FILEEXT".deletingPathExtension, "Name")
        XCTAssertEqual("Name.FileExt".deletingPathExtension, "Name")

        // Max 20 Chars in last Extension
        XCTAssertEqual("Name.VeryLongPathExtension".deletingPathExtension, "Name.VeryLongPathExtension")

        // Double extension
        XCTAssertEqual("Name.html.twig".deletingPathExtension, "Name")

        // No camel case in 2nd extension
        XCTAssertEqual("Mr.Smith.txt".deletingPathExtension, "Mr.Smith")

        // No Space in 2nd extension
        XCTAssertEqual("Mr. smith.txt".deletingPathExtension, "Mr. smith")

        // Max 10 Chars in 2nd Extension
        XCTAssertEqual("Name.pathExtensionTest.jpg".deletingPathExtension, "Name.pathExtensionTest")

        // Ending with dot
        XCTAssertEqual("Name.jpg.".deletingPathExtension, "Name")

        // No tripple extension
        XCTAssertEqual("Name.test.html.twig".deletingPathExtension, "Name.test")

        // No extension
        XCTAssertEqual("Name".deletingPathExtension, "Name")

        // Only a-z0-9 and _
        XCTAssertEqual("Name.nö".deletingPathExtension, "Name.nö")
        XCTAssertEqual("Name.-TXT".deletingPathExtension, "Name.-TXT")

        // Not complete string
        XCTAssertEqual(".scratch.tiff".deletingPathExtension, ".scratch")
        XCTAssertEqual(".scratch".deletingPathExtension, ".scratch")

        // Ignore duplicate dot
        XCTAssertEqual("scratch..tiff".deletingPathExtension, "scratch")
    }

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

    func testSplitRegex() {
        XCTAssertEqual(try! "A|B|C".split(regex: "[|]"), ["A", "B", "C"])
        XCTAssertEqual(try! "A|B|".split(regex: "[|]"), ["A", "B", ""])
        XCTAssertEqual(try! "|B|".split(regex: "[|]"), ["", "B", ""])
        XCTAssertEqual(try! "||".split(regex: "[|]"), ["", "", ""])
        XCTAssertEqual(try! "ABC".split(regex: "[|]"), ["ABC"])
        XCTAssertEqual(try! "abc".split(regex: "."), ["", "", "", ""])
        XCTAssertEqual(try! "abc".split(regex: "\\b"), ["", "abc", ""])
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
        ("testTrimming", testTrimming),
        ("testContains", testContains),
        ("testMatchRegex", testMatchRegex),
    ]
}
