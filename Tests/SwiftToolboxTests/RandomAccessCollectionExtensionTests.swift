//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class RandomAccessCollectionExtensionTests: XCTestCase {
    func testLeastCommonSlice() {
        XCTAssertEqual(["Bla", ".", "Bla", ".", "Bla", ".", "Bla", ".", "Bla", "."].leastCommonSlice, ["Bla", "."])
        XCTAssertNil(["Bla", ".", "Bla", ".", "Bla", ".", "Bla", ".", "Bla", "X"].leastCommonSlice)
        XCTAssertEqual(["Bla", "Bla"].leastCommonSlice, ["Bla"])
        XCTAssertNil(["Bla"].leastCommonSlice)
    }

    func testReplaceSlice() {
        XCTAssertEqual(["A", "B", "A", "A", "C"].replacingOccurrences(of: ["A"], with: ["D"]), ["D", "B", "D", "D", "C"])
        XCTAssertEqual(["A", "B", "C", "A"].replacingOccurrences(of: ["A"], with: ["D", "E"]), ["D", "E", "B", "C", "D", "E"])
        XCTAssertEqual(["A", "B", "C", "A", "B"].replacingOccurrences(of: ["A", "B"], with: ["D"]), ["D", "C", "D"])
        XCTAssertEqual(["A", "B", "C"].replacingOccurrences(of: ["Q"], with: ["R"]), ["A", "B", "C"])
        XCTAssertEqual(["A", "B", "C"].replacingOccurrences(of: ["B"], with: ["A", "B"]), ["A", "A", "B", "C"])
    }

    static var allTests = [
        ("testLeastCommonSlice", testLeastCommonSlice),
        ("testReplaceSlice", testReplaceSlice),
    ]
}
