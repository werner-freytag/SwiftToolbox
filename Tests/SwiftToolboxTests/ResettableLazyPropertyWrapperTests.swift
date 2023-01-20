//
//  Copyright © Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class ResettableLazyPropertyWrapperTests: XCTestCase {
    class TestClass {
        @ResettableLazy var date: Date = .init()

        func resetDate() {
            _date.reset()
        }
    }

    func testInitiate() {
        let testClass = TestClass()
        XCTAssertNotNil(testClass.date)
    }

    func testLazy() {
        let testClass = TestClass()
        let date = testClass.date
        sleep(1)

        XCTAssertEqual(date, testClass.date)
    }

    func testReset() {
        let testClass = TestClass()
        let date = testClass.date
        sleep(1)

        testClass.resetDate()
        XCTAssertNotEqual(date, testClass.date)
    }

    static var allTests = [
        ("testInitiate", testInitiate),
        ("testLazy", testLazy),
        ("testReset", testReset),
    ]
}
