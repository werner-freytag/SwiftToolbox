//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class FunctionsTests: XCTestCase {
    func testCast() {
        var str: String? = try? cast(3)
        XCTAssertNil(str)

        str = try? cast("3")
        XCTAssertNotNil(str)

        var err: Error?
        do {
            str = try cast(3)
        } catch {
            err = error
        }

        XCTAssertNotNil(err)
    }

    static var allTests = [
        ("testCast", testCast),
    ]
}
