import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(ArrayExtensionTests.allTests),
            testCase(CollectionExtensionTests.allTests),
            testCase(ColorExtensionTests.allTests),
            testCase(EqualableTests.allTests),
            testCase(LoopSequenceTests.allTests),
            testCase(SequenceExtensionTests.allTests),
            testCase(StringEncodingExtensionTest.allTests),
            testCase(StringExtensionTests.allTests),
            testCase(StringProtocolCaseInsensitiveCompareTests.allTests),
            testCase(StringProtocolDiffTests.allTests),
            testCase(StringProtocolExtensionTests.allTests),
            testCase(StringProtocolPartitionTests.allTests),
            testCase(SwiftToolboxTests.allTests),
        ]
    }
#endif
