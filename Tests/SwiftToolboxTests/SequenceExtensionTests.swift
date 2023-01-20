//
//  Copyright © Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class SequenceExtensionTests: XCTestCase {
    func testIsEmpty() {
        let emptySequence = (0 ..< 0).makeIterator()
        let nonEmptySequence = (0 ..< 10).makeIterator()

        XCTAssertEqual(emptySequence.isEmpty, true)
        XCTAssertEqual(nonEmptySequence.isEmpty, false)
    }

    func testCartesian() {
        struct Combi: Equatable {
            let s: String
            let i: Int

            init(_ s: String, _ i: Int) {
                self.s = s
                self.i = i
            }
        }

        // Combination
        XCTAssertEqual([Combi("A", 1), Combi("A", 2), Combi("B", 1), Combi("B", 2), Combi("C", 1), Combi("C", 2)], cartesian(["A", "B", "C"], [1, 2]).map { Combi($0.0, $0.1) })

        // Empty results
        XCTAssertEqual([Combi](), cartesian(["A", "B", "C"], [Int]([])).map { Combi($0.0, $0.1) })
        XCTAssertEqual([Combi](), cartesian([String]([]), [1, 2]).map { Combi($0.0, $0.1) })
        XCTAssertEqual([Combi](), cartesian([String]([]), [Int]([])).map { Combi($0.0, $0.1) })
    }

    func testHasDuplicates() {
        // Combination
        XCTAssertEqual(true, [1, 2, 3, 2].hasDuplicates())
        XCTAssertEqual(false, [1, 2, 3, 4].hasDuplicates())
        XCTAssertEqual(true, [-2, 1, 2].hasDuplicates(on: { $0 * $0 }))
        XCTAssertEqual(false, [0, 1, 2].hasDuplicates(on: { $0 * $0 }))
    }

    static var allTests = [
        ("testIsEmpty", testIsEmpty),
        ("testCartesian", testCartesian),
        ("testHasDuplicates", testHasDuplicates),
    ]
}
