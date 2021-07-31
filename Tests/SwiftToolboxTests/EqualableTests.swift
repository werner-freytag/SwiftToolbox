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
    
    func testFirstIndexOf() {
        let car = Car()
        let truck = Truck()
        
        let array: [Equalable] = [car, truck]

        XCTAssertEqual(0, array.firstIndex(of: car))
        XCTAssertEqual(1, array.firstIndex(of: truck))
    }

    static var allTests = [
        ("testEqualable", testEqualable),
        ("testFirstIndexOf", testFirstIndexOf),
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

extension Apple: Equatable {}
extension Orange: Equatable {}

protocol Vehicle : Equalable {}

extension Equalable where Self: Vehicle {
    func equals(_ other: Any) -> Bool {
        return type(of: other) == type(of: self)
    }
}

struct Car : Vehicle {}
struct Truck : Vehicle {}
