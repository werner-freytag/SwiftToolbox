//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

class EqualableTest: XCTestCase {
    func testEqualable() {
        expect(AnyEqualable(Apple(weight: 10, grade: 2)) == AnyEqualable(Apple(weight: 10, grade: 2))) == true
        expect(AnyEqualable(Apple(weight: 10, grade: 2)) == AnyEqualable(Apple(weight: 10, grade: 3))) == false
        expect(AnyEqualable(Apple(weight: 10, grade: 2)) == AnyEqualable(Orange(weight: 10, grade: 2))) == false
    }
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
    static func ==(lhs: Apple, rhs: Apple) -> Bool {
        return lhs.weight == rhs.weight && lhs.grade == rhs.grade
    }
}

extension Orange: Equatable {
    static func ==(lhs: Orange, rhs: Orange) -> Bool {
        return lhs.weight == rhs.weight && lhs.grade == rhs.grade
    }
}
