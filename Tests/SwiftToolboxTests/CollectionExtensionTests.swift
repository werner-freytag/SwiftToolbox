//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class CollectionExtensionTests: XCTestCase {
    func testSafeSubscript() {
        let elements = [1, 2, 3]

        XCTAssertEqual(elements[safe: 0], 1)
        XCTAssertNil(elements[safe: elements.count])

        let range = 0 ..< 3

        XCTAssertEqual(range[safe: 0], 0)
        XCTAssertNil(range[safe: 3])
    }

    static var allTests = [
        ("testSafeSubscript", testSafeSubscript),
    ]
}
