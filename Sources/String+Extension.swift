//
//  Copyright © 2016 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

extension String {
    public var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    public subscript(range: CountablePartialRangeFrom<Int>) -> Substring {
        return self[index(startIndex, offsetBy: range.lowerBound)...]
    }
    
    public subscript(range: CountableRange<Int>) -> Substring {
        return self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: CountableClosedRange<Int>) -> Substring {
        return self[index(startIndex, offsetBy: range.lowerBound)...index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: PartialRangeUpTo<Int>) -> Substring {
        return self[..<index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: PartialRangeThrough<Int>) -> Substring {
        return self[...index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(index: Int) -> Substring {
        return self[index...index]
    }
    
    public func naturalCompare(_ other: String) -> Bool {
        return localizedCaseInsensitiveCompare(other) == .orderedSame
    }
}

extension String {
    public func base64Encoded() -> Data? {
        return Data(base64Encoded: self)
    }
}

extension String {
    public func contains(_ find: String, options: String.CompareOptions = [.caseInsensitive, .widthInsensitive]) -> Bool {
        return self.range(of: find, options: options) != nil
    }
}

extension Array where Element == String {
    public func naturalSorted() -> [String] {
        return sorted {
            $0.localizedCaseInsensitiveCompare($1) == .orderedAscending
        }
    }
}

