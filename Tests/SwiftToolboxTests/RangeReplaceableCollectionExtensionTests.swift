//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class RangeReplaceableCollectionExtensionTests: XCTestCase {
    func testReplaceSlice() {
        XCTAssertEqual(["A", "B", "A", "A", "C"].replacingOccurrences(of: ["A"], with: ["D"]), ["D", "B", "D", "D", "C"])
        XCTAssertEqual(["A", "B", "C", "A"].replacingOccurrences(of: ["A"], with: ["D", "E"]), ["D", "E", "B", "C", "D", "E"])
        XCTAssertEqual(["A", "B", "C", "A", "B"].replacingOccurrences(of: ["A", "B"], with: ["D"]), ["D", "C", "D"])
        XCTAssertEqual(["A", "B", "C"].replacingOccurrences(of: ["Q"], with: ["R"]), ["A", "B", "C"])
        XCTAssertEqual(["A", "B", "C"].replacingOccurrences(of: ["B"], with: ["A", "B"]), ["A", "A", "B", "C"])
        XCTAssertEqual(["A", "A"].replacingOccurrences(of: ["A"], with: []), [])
    }

    func testReplaceSliceInSlice() {
        let array = ["A", "B", "B", "C"]
        let slice = array[1 ..< 3] // ["B", "B"]
        XCTAssertEqual(slice.replacingOccurrences(of: ["B"], with: []), [])
    }

    func testMovingRange() {
        let string = "HelloWorld"

        // Move to end
        XCTAssertEqual("WorldHello", string.moving(range: string.startIndex ..< string.index(string.startIndex, offsetBy: 5), to: string.endIndex))

        // Move right
        XCTAssertEqual("WHelloorld", string.moving(range: string.startIndex ..< string.index(string.startIndex, offsetBy: 5), to: string.index(string.startIndex, offsetBy: 6)))

        // Move right inside range
        XCTAssertEqual("HelloWorld", string.moving(range: string.startIndex ..< string.index(string.startIndex, offsetBy: 5), to: string.index(after: string.startIndex)))

        // Move to start
        XCTAssertEqual("WorldHello", string.moving(range: string.index(string.endIndex, offsetBy: -5) ..< string.endIndex, to: string.startIndex))

        // Move left
        XCTAssertEqual("HellWorldo", string.moving(range: string.index(string.endIndex, offsetBy: -5) ..< string.endIndex, to: string.index(string.endIndex, offsetBy: -6)))

        // Move left inside range
        XCTAssertEqual("HelloWorld", string.moving(range: string.index(string.endIndex, offsetBy: -5) ..< string.endIndex, to: string.index(string.endIndex, offsetBy: -4)))
    }

    static var allTests = [
        ("testReplaceSlice", testReplaceSlice),
        ("testReplaceSliceInSlice", testReplaceSliceInSlice),
        ("testMovingRange", testMovingRange),
    ]
}
