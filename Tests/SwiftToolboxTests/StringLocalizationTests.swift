//
//  Copyright © Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class StringLocalizationTests: XCTestCase {
    func testLocalized() {
        XCTAssertEqual("Hello".localized, "Hello")
    }

    static var allTests = [
        ("testLocalized", testLocalized),
    ]
}
