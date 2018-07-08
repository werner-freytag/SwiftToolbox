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
    ///
    /// - Returns: escpaped string
    public func regexQuoted() -> String {
        return replacingOccurrences(of: "\\[|\\]|\\(|\\)|\\\\|\\*|\\+|\\?|\\{|\\}|\\^|\\$|\\.|\\||\\^|\\$",
                                    with: "\\\\$0",
                                    options: .regularExpression)
    }
}

extension StringProtocol where Index == String.Index {
    
    /// Returns a sequence of substrings for all matches of the given search string
    ///
    /// - Parameters:
    ///   - searchString: The string to search for.
    ///   - options: A mask specifying search options.
    /// - Returns: A sequence providing the substring for all matches
    public func substrings(matching searchString: String, options: String.CompareOptions = []) -> AnySequence<Self.SubSequence> {
        return AnySequence(ranges(matching: searchString, options: options)
            .lazy
            .map { self[$0] })
    }
    
    /// Returns a sequence for all matches of the given search string
    ///
    /// - Parameters:
    ///   - searchString: The string to search for.
    ///   - options: A mask specifying search options.
    /// - Returns: A sequence providing the range for all matches
    public func ranges(matching searchString: String, options: String.CompareOptions = []) -> AnySequence<Range<String.Index>> {
        return AnySequence(sequence(state: startIndex) { offset in
            guard offset < self.endIndex,
                let foundRange = self.range(of: searchString, options: options, range: offset..<self.endIndex)
                else { return nil }
            
            if foundRange.upperBound > offset {
                offset = foundRange.upperBound
            } else {
                offset = self.index(after: offset)
            }
            
            return foundRange
        })
    }
}

extension StringProtocol where Index == String.Index {
    public func findWords() -> AnySequence<Self.SubSequence> {
        return substrings(matching: "\\p{Lu}+(?!\\p{Ll})|\\p{Lu}?\\p{Ll}+|\\d+", options: .regularExpression)
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
