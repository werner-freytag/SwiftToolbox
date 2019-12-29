//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class ThreadExtensionTest: XCTestCase {
    func testRunOnMain() {
        assert(Thread.isMainThread)

        var isOnMainThread = false
        Thread.runOnMain {
            isOnMainThread = Thread.isMainThread
        }
        XCTAssertTrue(isOnMainThread)

        isOnMainThread = false

        let expectation = self.expectation(description: #function)
        DispatchQueue(label: "Test").async {
            XCTAssertFalse(Thread.isMainThread)
            Thread.runOnMain {
                isOnMainThread = Thread.isMainThread
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 10)

        XCTAssertTrue(isOnMainThread)
    }

    static var allTests = [
        ("testRunOnMain", testRunOnMain),
    ]
}
