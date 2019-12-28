//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Nimble
@testable import SwiftToolbox
import XCTest

class CollectionExtensionTests: XCTestCase {
    func testSafeSubscript() {
        let elements = [1, 2, 3]

        expect(elements[safe: 0]) == 1
        expect(elements[safe: elements.count]).to(beNil())

        let range = 0 ..< 3

        expect(range[safe: 0]) == 0
        expect(range[safe: 3]).to(beNil())
    }

    static var allTests = [
        ("testSafeSubscript", testSafeSubscript),
    ]
}
