//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

class StringProtocolDiffTests: XCTestCase {
    func testDiffBeginning() {
        let str = "Hello"
        let diff = str.diff(with: "hello")!
        
        expect(diff.range) == str.startIndex..<str.index(after: str.startIndex)
        expect(diff.replacement) == "h"
        expect(diff.overlap) == 0
    }
        
    func testDiffMiddleOverlapping() {
        let str = "Hello world"
        let diff = str.diff(with: "Hello crazy world")!
        
        expect(diff.range) == str.index(str.startIndex, offsetBy: 5)..<str.index(str.startIndex, offsetBy: 6)
        expect(diff.replacement) == " crazy "
        expect(diff.overlap) == 1
    }
        
    func testDiffMiddleRemoving() {
        let str = "Hello crazy world"
        let diff = str.diff(with: "Hello world")!
        
        expect(diff.range) == str.index(str.startIndex, offsetBy: 5)..<str.index(str.startIndex, offsetBy: 12)
        expect(diff.replacement) == " "
        expect(diff.overlap) == 1
    }
        
    func testAsymetricOverlap() {
        let str = "Hello  world"
        let diff = str.diff(with: "Hello  crazy world")!
        
        expect(diff.range) == str.index(str.startIndex, offsetBy: 6)..<str.index(str.startIndex, offsetBy: 7)
        expect(diff.replacement) == " crazy "
        expect(diff.overlap) == 1
    }
    
    func testTwoCharsOverlap() {
        let str = "Hello  world"
        let diff = str.diff(with: "Hello  crazy  world")!
        
        expect(diff.range) == str.index(str.startIndex, offsetBy: 5)..<str.index(str.startIndex, offsetBy: 7)
        expect(diff.replacement) == "  crazy  "
        expect(diff.overlap) == 2
    }
    
    func testNoMatch() {
        let str = "Hello world"
        let diff = str.diff(with: "Hello world")
        
        expect(diff).to(beNil())
    }
}
