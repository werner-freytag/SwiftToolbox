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

    static var allTests = [
        ("testLeastCommonSlice", testLeastCommonSlice),
    ]
}
