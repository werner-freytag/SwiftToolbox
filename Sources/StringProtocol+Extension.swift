//
//  Copyright © 2016 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

extension StringProtocol where Index == String.Index {
    public subscript(range: CountablePartialRangeFrom<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound)...]
    }
    
    public subscript(range: CountableRange<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: CountableClosedRange<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound)...index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: PartialRangeUpTo<Int>) -> Self.SubSequence {
        return self[..<index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: PartialRangeThrough<Int>) -> Self.SubSequence {
        return self[...index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(index: Int) -> Self.SubSequence {
        return self[index...index]
    }
}

extension StringProtocol where Index == String.Index {
    public func commonSuffix<T: StringProtocol>(with aString: T, options: String.CompareOptions = []) -> String {
        let reversedSuffix = String(reversed()).commonPrefix(with: String(aString.reversed()), options: options)
        return String(reversedSuffix.reversed())
    }
}

extension StringProtocol where Index == String.Index {
    
    /// Escapes regex chars in a string
    public func regexQuoted() -> String {
        return replacingOccurrences(of: "\\[|\\]|\\(|\\)|\\\\|\\*|\\+|\\?|\\{|\\}|\\^|\\$|\\.|\\||\\^|\\$",
                                    with: "\\\\$0",
                                    options: .regularExpression)
    }

    /// Returns all matches of a pattern
    public func substrings(matching regex: String, options: String.CompareOptions = []) -> [Self.SubSequence] {
        var options = options
        options.insert(.regularExpression)
        
        var result: [Self.SubSequence] = []
        
        var range = startIndex..<endIndex
        while let foundRange = self.range(of: regex, options: options, range: range, locale: nil) {
            result.append(self[foundRange])
            
            guard foundRange.upperBound < endIndex else { break }
            
            if foundRange.upperBound > range.lowerBound {
                range = foundRange.upperBound..<endIndex
            } else {
                range = index(after: range.lowerBound)..<endIndex
            }
        }
        
        return result
    }
}

extension StringProtocol where Index == String.Index {
    public func findWords() -> [Self.SubSequence] {
        return substrings(matching: "\\p{Lu}+(?!\\p{Ll})|\\p{Lu}?\\p{Ll}+|\\d+")
    }
}

extension StringProtocol where Index == String.Index {
    public func upperCamelCased() -> String {
        return findWords().map { $0.prefix(1).uppercased() + $0.dropFirst().lowercased() }.joined()
    }
}

extension StringProtocol where Index == String.Index {
    /**
     The path extension of the URL, or an empty string if the path is an empty string.
     */
    public var pathExtension: Self.SubSequence {
        guard let dots = range(of: "\\.+", options: [.regularExpression], range: deletingPathExtension.endIndex..<endIndex)
            else {
                return self[endIndex...]
        }
        
        return self[dots.upperBound...]
    }
    
    /**
     The last path component of the URL, or an empty string if the path is an empty string.
     */
    public var deletingPathExtension: Self.SubSequence {
        let pattern = "[^\\.]\\.+(([_a-z0-9]{1,10}|[_A-Z0-9]{1,10})\\.)?[_A-Za-z0-9]{1,20}$"
        
        guard let range = self.range(of: pattern, options: [.regularExpression, .widthInsensitive])
            else { return self[..<endIndex] }
        
        return self[...range.lowerBound]
    }
}
