//
//  Copyright © Werner Freytag. All rights reserved.
//

@testable import SwiftToolbox
import XCTest

final class AngleHelpersTests: XCTestCase {
    func testNormalizeArc() {
        XCTAssertEqual(3 - 1, normalizeArc(value: -3.0 - 1, max: 3))
        XCTAssertEqual(3 - 1, normalizeArc(value: -1.0, max: 3))
        XCTAssertEqual(3 - 0.1, normalizeArc(value: -0.1, max: 3))
        XCTAssertEqual(0, normalizeArc(value: 0, max: 3))
        XCTAssertEqual(3 - 0.1, normalizeArc(value: 3 - 0.1, max: 3))
        XCTAssertEqual(0, normalizeArc(value: 3, max: 3))
        XCTAssertEqual(3 - 1, normalizeArc(value: 2 * 3.0 - 1, max: 3))
    }

    func testNormalizeDegrees() {
        XCTAssertEqual(350, normalizeDegrees(-10.0))
    }

    func testNormalizeRadians() {
        XCTAssertEqual(7.1 - 2 * .pi, normalizeRadians(7.1))
    }
}
