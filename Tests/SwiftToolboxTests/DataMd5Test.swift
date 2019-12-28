//
//  Copyright © 2017-2019 Werner Freytag. All rights reserved.
//

import Nimble
@testable import SwiftToolbox
import XCTest

class DataMd5Test: XCTestCase {
    func testMd5() {
        expect("String".data(using: .utf8)!.md5Hash) == "27118326006d3829667a400ad23d5d98"
    }
}
