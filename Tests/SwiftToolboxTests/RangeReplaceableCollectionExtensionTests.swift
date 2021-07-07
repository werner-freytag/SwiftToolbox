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

    static var allTests = [
        ("testReplaceSlice", testReplaceSlice),
    ]
}
