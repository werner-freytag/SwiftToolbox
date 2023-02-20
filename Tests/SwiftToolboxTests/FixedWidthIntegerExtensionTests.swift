//
//  Copyright © Werner Freytag. All rights reserved.
//

@testable import SwiftToolbox
import XCTest

class FixedWidthIntegerExtensionTests: XCTestCase {
    func testNumberOfDigits() {
        XCTAssertEqual(1, 0.numberOfDigits)
        XCTAssertEqual(1, 1.numberOfDigits)
        XCTAssertEqual(1, (-1).numberOfDigits)
        XCTAssertEqual(1, 9.numberOfDigits)
        XCTAssertEqual(1, (-9).numberOfDigits)
        XCTAssertEqual(2, 10.numberOfDigits)
        XCTAssertEqual(2, (-10).numberOfDigits)
        XCTAssertEqual(2, 99.numberOfDigits)
        XCTAssertEqual(2, (-99).numberOfDigits)
        XCTAssertEqual(3, 100.numberOfDigits)
        XCTAssertEqual(3, (-100).numberOfDigits)
    }

    static var allTests = [
        ("testNumberOfDigits", testNumberOfDigits),
    ]
}
