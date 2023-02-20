//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

public extension String.CompareOptions {
    /// Errors to be thrown
    enum Error: Swift.Error {
        /// Error: Option is invalid
        case invalidOption(NSRegularExpression.Options)
    }

    /// Initialize from regexOptions
    /// - Parameter regexOptions: regex options
    init(_ regexOptions: NSRegularExpression.Options) throws {
        let invalidOptions: [NSRegularExpression.Options] = [
            .allowCommentsAndWhitespace,
            .ignoreMetacharacters,
            .dotMatchesLineSeparators,
            .anchorsMatchLines,
            .useUnixLineSeparators,
            .useUnicodeWordBoundaries,
        ]

        for option in invalidOptions {
            guard !regexOptions.contains(option) else { throw Error.invalidOption(option) }
        }

        self = [.regularExpression]
        if regexOptions.contains(.caseInsensitive) {
            insert(.caseInsensitive)
        }
    }
}

public extension NSRegularExpression {
    /// Test regex for match in the whole string
    func matches(in string: String, options: MatchingOptions = []) -> [NSTextCheckingResult] {
        matches(in: string, options: options, range: string.nsRange)
    }
}

public extension String {
    /// Returns a sequence of ranges matching the given regex
    func ranges(of regex: NSRegularExpression) -> some Sequence<Range<Index>> {
        regex.matches(in: self)
            .map { $0.range(in: self) }
    }

    /// Returns a sequence of substrings matching the given regex
    func substrings(of regex: NSRegularExpression) -> some Sequence<Substring> {
        ranges(of: regex)
            .map { self[$0] }
    }

    /// Returns the string replacing the matches of the regex with a template string
    func replacing(_ regex: NSRegularExpression, with template: String) -> String {
        let mutableString = NSMutableString(string: self)
        regex.replaceMatches(in: mutableString, range: nsRange, withTemplate: template)
        return mutableString as String
    }
}

private extension String {
    var nsRange: NSRange { NSRange(location: 0, length: (self as NSString).length) }
}
