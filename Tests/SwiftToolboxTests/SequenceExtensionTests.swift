//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Nimble
import SwiftToolbox
import XCTest

class SequenceExtensionTests: XCTestCase {
    func testIsEmpty() {
        let emptySequence = (0 ..< 0).makeIterator()
        let nonEmptySequence = (0 ..< 10).makeIterator()

        expect(emptySequence.isEmpty) == true
        expect(nonEmptySequence.isEmpty) == false
    }

    static var allTests = [
        ("testIsEmpty", testIsEmpty),
    ]
}
