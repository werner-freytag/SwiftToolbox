//
//  Copyright © Werner Freytag. All rights reserved.
//

import XCTest

import SwiftToolboxTests

var tests = [XCTestCaseEntry]()
tests += ArrayExtensionTests.allTests
tests += ColorExtensionTests.allTests
tests += CollectionExtensionTests.allTests
tests += EqualableTests.allTests
tests += FunctionsTests.allTests
tests += LoopSequenceTests.allTests
tests += SequenceExtensionTests.allTests
tests += StringEncodingExtensionTest.allTests
tests += StringExtensionTests.allTests
tests += StringLocalizationTests.allTests
tests += StringProtocolCaseInsensitiveCompareTests.allTests
tests += StringProtocolDiffTests.allTests
tests += StringProtocolExtensionTests.allTests
tests += StringProtocolHTMLTests.allTests
tests += StringProtocolPartitionTests.allTests
tests += ThreadExtensionTests.allTests
tests += NSRegularExpressionExtensionTests.allTests
XCTMain(tests)
