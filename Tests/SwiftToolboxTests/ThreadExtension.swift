//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Nimble
import SwiftToolbox
import XCTest

class ThreadExtensionTest: XCTestCase {
    func testRunOnMain() {
        assert(Thread.isMainThread)

        var isOnMainThread = false
        Thread.runOnMain {
            isOnMainThread = Thread.isMainThread
        }
        expect(isOnMainThread).to(beTrue())

        isOnMainThread = false

        let expectation = self.expectation(description: #function)
        DispatchQueue(label: "Test").async {
            expect(Thread.isMainThread).to(beFalse())
            Thread.runOnMain {
                isOnMainThread = Thread.isMainThread
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 10)

        expect(isOnMainThread).to(beTrue())
    }

    static var allTests = [
        ("testRunOnMain", testRunOnMain),
    ]
}
