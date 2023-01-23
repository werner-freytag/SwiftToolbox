//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

public extension String.CompareOptions {
    enum Error: Swift.Error {
        case invalidOption(NSRegularExpression.Options)
    }

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
    func matches(in string: String, options: MatchingOptions = []) -> [NSTextCheckingResult] {
        matches(in: string, options: options, range: string.nsRange)
    }
}

public extension String {
    func ranges(of regex: NSRegularExpression) -> some Sequence<Range<Index>> {
        regex.matches(in: self)
            .map { $0.range(in: self) }
    }

    func substrings(of regex: NSRegularExpression) -> some Sequence<Substring> {
        ranges(of: regex)
            .map { self[$0] }
    }

    func replacing(_ regex: NSRegularExpression, with template: String) -> String {
        let mutableString = NSMutableString(string: self)
        regex.replaceMatches(in: mutableString, range: nsRange, withTemplate: template)
        return mutableString as String
    }
}

private extension String {
    var nsRange: NSRange { NSRange(location: 0, length: (self as NSString).length) }
}
