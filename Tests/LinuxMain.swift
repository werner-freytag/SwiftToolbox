import XCTest

import SwiftToolboxTests

var tests = [XCTestCaseEntry]()
tests += ArrayExtensionTests.allTests()
tests += ColorExtensionTests.allTests()
tests += EqualableTests.allTests()
tests += LoopSequenceTests.allTests()
tests += SequenceExtensionTests.allTests()
tests += StringEncodingExtensionTest.allTests()
tests += StringExtensionTests.allTests()
tests += StringProtocolCaseInsensitiveCompareTests.allTests()
tests += StringProtocolDiffTests.allTests()
tests += StringProtocolExtensionTests.allTests()
tests += StringProtocolPartitionTests.allTests()
tests += SwiftToolboxTests.allTests()
XCTMain(tests)
