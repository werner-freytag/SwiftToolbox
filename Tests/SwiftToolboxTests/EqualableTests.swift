//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class EqualableTests: XCTestCase {
    func testEqualable() {
        XCTAssertEqual(AnyEqualable(Apple(weight: 10, grade: 2)) == AnyEqualable(Apple(weight: 10, grade: 2)), true)
        XCTAssertEqual(AnyEqualable(Apple(weight: 10, grade: 2)) == AnyEqualable(Apple(weight: 10, grade: 3)), false)
        XCTAssertEqual(AnyEqualable(Apple(weight: 10, grade: 2)) == AnyEqualable(Orange(weight: 10, grade: 2)), false)
    }

    static var allTests = [
        ("testEqualable", testEqualable),
    ]
}

struct Apple {
    let weight: Int
    let grade: Int
}

struct Orange {
    let weight: Int
    let grade: Int
}

extension Apple: Equalable {}
extension Orange: Equalable {}

extension Apple: Equatable {
    static func == (lhs: Apple, rhs: Apple) -> Bool {
        return lhs.weight == rhs.weight && lhs.grade == rhs.grade
    }
}

extension Orange: Equatable {
    static func == (lhs: Orange, rhs: Orange) -> Bool {
        return lhs.weight == rhs.weight && lhs.grade == rhs.grade
    }
}
