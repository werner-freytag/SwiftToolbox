//
//  Copyright © 2017-2019 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class DefaultStringInterpolationExtensionTests: XCTestCase {
    func testDebugString() {
        XCTAssertEqual("Test debugDescription", "\(debugDescription: Test())")
    }
}

private struct Test: CustomDebugStringConvertible {
    var debugDescription = "Test debugDescription"
}
