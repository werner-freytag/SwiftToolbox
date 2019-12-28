//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Nimble
@testable import SwiftToolbox
import XCTest

class StringLocalizationTests: XCTestCase {
    func testLocalized() {
        expect("Hello".localized) == "Hello"
    }

    static var allTests = [
        ("testLocalized", testLocalized),
    ]
}
