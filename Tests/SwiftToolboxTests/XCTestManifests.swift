//
//  Copyright © Werner Freytag. All rights reserved.
//

import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(ArrayExtensionTests.allTests),
            testCase(CollectionExtensionTests.allTests),
            testCase(ColorExtensionTests.allTests),
            testCase(EqualableTests.allTests),
            testCase(FunctionsTests.allTests),
            testCase(LoopSequenceTests.allTests),
            testCase(ResettableLazyPropertyWrapperTests.allTests),
            testCase(SequenceExtensionTests.allTests),
            testCase(StringEncodingExtensionTest.allTests),
            testCase(StringExtensionTests.allTests),
            testCase(StringLocalizationTests.allTests),
            testCase(StringProtocolCaseInsensitiveCompareTests.allTests),
            testCase(StringProtocolDiffTests.allTests),
            testCase(StringProtocolExtensionTests.allTests),
            testCase(StringProtocolHTMLTests.allTests),
            testCase(StringProtocolPartitionTests.allTests),
            testCase(ThreadExtensionTests.allTests),
        ]
    }
#endif
