//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

class AnyEquatableTest: XCTestCase {
    func testAnyEquatableTest() {
        let apple1 = Apple(weight: 10, grade: 2)
        let apple2 = Apple(weight: 10, grade: 2)
        expect(apple1.asEquatable) == apple2.asEquatable
        
        let apple3 = Apple(weight: 12, grade: 2)
        let apple4 = Apple(weight: 12, grade: 3)
        expect(apple3.asEquatable) != apple4.asEquatable
        
        let apple = Apple(weight: 10, grade: 2)
        let orange = Orange(weight: 10, grade: 2)
        
        expect(apple.asEquatable) != orange.asEquatable
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

extension Apple: AnyEquatableWrappable {}
extension Orange: AnyEquatableWrappable {}

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
