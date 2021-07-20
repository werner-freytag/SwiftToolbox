//
//  Copyright © 2021 Werner Freytag. All rights reserved.
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

public extension String {
    func ranges(of regex: NSRegularExpression, options: String.CompareOptions = []) throws -> AnySequence<Range<String.Index>> {
        ranges(of: regex.pattern, options: try CompareOptions(regex.options).union(options))
    }

    func substrings(of regex: NSRegularExpression, options: String.CompareOptions = []) throws -> AnySequence<Substring> {
        substrings(of: regex.pattern, options: try CompareOptions(regex.options).union(options))
    }
}
