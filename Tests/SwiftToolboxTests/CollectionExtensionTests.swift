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

    func testCommonPrefix() {
        XCTAssertEqual(["A", "b", "C"].commonPrefix(with: ["A", "B", "C"]), ["A"])
        XCTAssertEqual(["A", "B", "C"].commonPrefix(with: ["A", "B", "C"]), ["A", "B", "C"])
        XCTAssertEqual(["A", "B", "C", "d"].commonPrefix(with: ["A", "B", "C"]), ["A", "B", "C"])
        XCTAssertEqual(["a", "B", "C", "D"].commonPrefix(with: ["A", "B", "C"]), [])
        XCTAssertEqual(["A"].commonPrefix(with: ["A", "B", "C"]), ["A"])
        XCTAssertEqual(Array([].commonPrefix(with: ["A", "B", "C"])), [])
    }

    func testCommonSuffix() {
        XCTAssertEqual(["A", "b", "C"].commonSuffix(with: ["A", "B", "C"]), ["C"])
        XCTAssertEqual(["A", "B", "C"].commonSuffix(with: ["A", "B", "C"]), ["A", "B", "C"])
        XCTAssertEqual(["z", "A", "B", "C"].commonSuffix(with: ["A", "B", "C"]), ["A", "B", "C"])
        XCTAssertEqual(["a", "B", "C", "D"].commonSuffix(with: ["A", "B", "C"]), [])
        XCTAssertEqual(["C"].commonSuffix(with: ["A", "B", "C"]), ["C"])
        XCTAssertEqual(Array([].commonSuffix(with: ["A", "B", "C"])), [])
    }

    static var allTests = [
        ("testCommonPrefix", testCommonPrefix),
        ("testCommonSuffix", testCommonSuffix),
        ("testSafeSubscript", testSafeSubscript),
    ]
}
