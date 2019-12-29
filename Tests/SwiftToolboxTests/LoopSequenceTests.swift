//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class LoopSequenceTests: XCTestCase {
    func testSequence() {
        var result: [Int] = []

        var iteration = 0
        for i in LoopSequence(0 ..< 3) {
            guard iteration < 10 else { break }
            result.append(i)
            iteration += 1
        }

        XCTAssertEqual(result, [0, 1, 2, 0, 1, 2, 0, 1, 2, 0])
    }

    static var allTests = [
        ("testSequence", testSequence),
    ]
}
