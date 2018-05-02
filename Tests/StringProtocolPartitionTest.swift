//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
import XCTest
@testable import SwiftToolbox

class StringProtocolPartitionTest: XCTestCase {
    
    func testPartition() {
        let str = "Hello"
        
        expect(str.partition()) == [["Hello"], ["Hell", "o"], ["Hel", "lo"], ["Hel", "l", "o"], ["He", "llo"], ["He", "ll", "o"], ["He", "l", "lo"], ["He", "l", "l", "o"], ["H", "ello"], ["H", "ell", "o"], ["H", "el", "lo"], ["H", "el", "l", "o"], ["H", "e", "llo"], ["H", "e", "ll", "o"], ["H", "e", "l", "lo"], ["H", "e", "l", "l", "o"]]
    }
    
    func testEmpty() {
        let str = ""
        
        expect(str.partition()) == []
    }
    
    
}
