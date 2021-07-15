//
//  Copyright © 2021 Werner Freytag. All rights reserved.
//

@testable import SwiftToolbox
import XCTest

class NSRegularExpressionExtensionTests: XCTestCase {
    func testCreateOptions() {
        XCTAssertEqual(String.CompareOptions([.regularExpression]), try String.CompareOptions(NSRegularExpression.Options([])))
        XCTAssertEqual(String.CompareOptions([.regularExpression, .caseInsensitive]), try String.CompareOptions(NSRegularExpression.Options([.caseInsensitive])))
        XCTAssertThrowsError(try String.CompareOptions(NSRegularExpression.Options([.caseInsensitive, .useUnixLineSeparators])))
    }

    func testRanges() {
        let string = "HelloWorld"
        XCTAssertEqual([string.startIndex ..< string.index(string.startIndex, offsetBy: 5), string.index(string.startIndex, offsetBy: 5) ..< string.endIndex], Array(try string.ranges(of: NSRegularExpression(pattern: "[A-Z][a-z]+"))))

        // caseInsensitive
        XCTAssertEqual([string.startIndex ..< string.endIndex], Array(try string.ranges(of: NSRegularExpression(pattern: "[A-Z][a-z]+", options: .caseInsensitive))))

        // caseInsensitive as func argument
        XCTAssertEqual([string.startIndex ..< string.endIndex], Array(try string.ranges(of: NSRegularExpression(pattern: "[A-Z][a-z]+"), options: .caseInsensitive)))
    }

    func testSubstrings() {
        let string = "HelloWorld"
        XCTAssertEqual(["Hello", "World"], Array(try string.substrings(of: NSRegularExpression(pattern: "[A-Z][a-z]+"))))

        // caseInsensitive by NSRegularExpression
        XCTAssertEqual(["HelloWorld"], Array(try string.substrings(of: NSRegularExpression(pattern: "[A-Z][a-z]+", options: .caseInsensitive))))

        // caseInsensitive base func argument
        XCTAssertEqual(["HelloWorld"], Array(try string.substrings(of: NSRegularExpression(pattern: "[A-Z][a-z]+"), options: .caseInsensitive)))
    }

    static var allTests = [
        ("testCreateOptions", testCreateOptions),
        ("testRanges", testRanges),
    ]
}
