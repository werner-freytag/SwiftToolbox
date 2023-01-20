//
//  Copyright © 2016 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

public extension StringProtocol where Index == String.Index {
    subscript(range: CountablePartialRangeFrom<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound)...]
    }

    subscript(range: CountableRange<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound) ..< index(startIndex, offsetBy: range.upperBound)]
    }

    subscript(range: CountableClosedRange<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound) ... index(startIndex, offsetBy: range.upperBound)]
    }

    subscript(range: PartialRangeUpTo<Int>) -> Self.SubSequence {
        return self[..<index(startIndex, offsetBy: range.upperBound)]
    }

    subscript(range: PartialRangeThrough<Int>) -> Self.SubSequence {
        return self[...index(startIndex, offsetBy: range.upperBound)]
    }

    subscript(index: Int) -> Self.SubSequence {
        return self[index ... index]
    }
}

public extension StringProtocol where Index == String.Index {
    func commonSuffix<T: StringProtocol>(with aString: T, options: String.CompareOptions = []) -> String {
        let reversedSuffix = String(reversed()).commonPrefix(with: String(aString.reversed()), options: options)
        return String(reversedSuffix.reversed())
    }
}

public extension StringProtocol where Index == String.Index {
    /// Escapes regex chars in a string
    ///
    /// - Returns: escpaped string
    func regexQuoted() -> String {
        return replacingOccurrences(of: "\\[|\\]|\\(|\\)|\\\\|\\*|\\+|\\?|\\{|\\}|\\^|\\$|\\.|\\||\\^|\\$",
                                    with: "\\\\$0",
                                    options: .regularExpression)
    }
}

public extension StringProtocol where Index == String.Index {
    /// Returns a sequence of substrings for all matches of the given search string
    ///
    /// - Parameters:
    ///   - searchString: The string to search for.
    ///   - options: A mask specifying search options.
    /// - Returns: A sequence providing the substring for all matches
    func substrings(of searchString: String, options: String.CompareOptions = []) -> some Sequence<SubSequence> {
        ranges(of: searchString, options: options)
            .map { self[$0] }
    }

    /// Returns a sequence for all matches of the given search string
    ///
    /// - Parameters:
    ///   - searchString: The string to search for.
    ///   - options: A mask specifying search options.
    /// - Returns: A sequence providing the range for all matches
    func ranges(of searchString: String, options: String.CompareOptions = []) -> some Sequence<Range<String.Index>> {
        sequence(state: startIndex) { offset in
            guard offset < self.endIndex,
                  let foundRange = self.range(of: searchString, options: options, range: offset ..< self.endIndex)
            else { return nil }

            if foundRange.upperBound > offset {
                offset = foundRange.upperBound
            } else {
                offset = self.index(after: offset)
            }

            return foundRange
        }
    }
}

public extension StringProtocol where Index == String.Index {
    func findWords() -> some Sequence<SubSequence> {
        substrings(of: "\\p{Lu}+(?!\\p{Ll})|\\p{Lu}?\\p{Ll}+|\\d+", options: .regularExpression)
    }
}

public extension StringProtocol where Index == String.Index {
    func upperCamelCased() -> String {
        return findWords().map { $0.prefix(1).uppercased() + $0.dropFirst().lowercased() }.joined()
    }

    var capitalizingFirstLetter: String {
        return prefix(1).uppercased() + dropFirst()
    }
}

public extension StringProtocol where Index == String.Index {
    /**
     The path extension of the URL, or an empty string if the path is an empty string.
     */
    var pathExtension: Self.SubSequence {
        guard let dots = range(of: "\\.+", options: [.regularExpression], range: deletingPathExtension.endIndex ..< endIndex)
        else {
            return self[endIndex...]
        }

        return self[dots.upperBound...]
    }

    /**
     The last path component of the URL, or an empty string if the path is an empty string.
     */
    var deletingPathExtension: Self.SubSequence {
        let pattern = "[^\\.]\\.+(([_a-z0-9]{1,10}|[_A-Z0-9]{1,10})\\.)?[_A-Za-z0-9]{1,20}\\.*$"

        guard let range = range(of: pattern, options: [.regularExpression, .widthInsensitive])
        else { return self[..<endIndex] }

        return self[...range.lowerBound]
    }
}

public extension StringProtocol {
    /// Remove whitespaces from start and end of string
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

public extension StringProtocol {
    /// Find out if string contains another string
    func contains(_ find: String, options: String.CompareOptions = [.caseInsensitive, .widthInsensitive]) -> Bool {
        return range(of: find, options: options) != nil
    }
}

public extension StringProtocol {
    /// Returns all subpatterns of the first match
    func match(regex pattern: String, options: NSRegularExpression.Options = []) throws -> [String]? {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let nsString = String(self) as NSString

        guard let match = regex.matches(in: String(self)).first
        else { return nil }

        var components: [String] = []
        for i in 0 ..< match.numberOfRanges {
            let range = match.range(at: i)
            if range.location == NSNotFound {
                components.append("")
            } else {
                components.append(nsString.substring(with: range) as String)
            }
        }

        return components
    }
}

public extension String {
    /// Splits a string by the given regular expression
    func split(regex pattern: String, options: NSRegularExpression.Options = []) throws -> [SubSequence]? {
        var result: [SubSequence] = []

        let regex = try NSRegularExpression(pattern: pattern, options: options)

        var offset = startIndex
        ranges(of: regex).forEach { range in
            result.append(self[offset ..< range.lowerBound])
            offset = range.upperBound
        }

        result.append(self[offset ..< endIndex])

        return result
    }
}
