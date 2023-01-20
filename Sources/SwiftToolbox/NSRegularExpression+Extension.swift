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
        matches(in: string, options: options, range: NSRange(location: 0, length: (string as NSString).length))
    }
}

public extension String {
    func ranges(of regex: NSRegularExpression) -> some Sequence<Range<Index>> {
        regex.matches(in: self)
            .map {
                index(startIndex, offsetBy: $0.range.lowerBound)
                    ..<
                    index(startIndex, offsetBy: $0.range.upperBound)
            }
    }

    func substrings(of regex: NSRegularExpression) -> some Sequence<Substring> {
        ranges(of: regex)
            .map { self[$0] }
    }
}
