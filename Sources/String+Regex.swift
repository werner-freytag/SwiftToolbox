//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

extension String {
    
    //
    // Escapes regex chars in a string
    //
    public func regexQuoted() -> String {
        return replacingOccurrences(of: "\\[|\\]|\\(|\\)|\\\\|\\*|\\+|\\?|\\{|\\}|\\^|\\$|\\.|\\||\\^|\\$",
                             with: "\\\\$0",
                             options: .regularExpression)
    }
    
    //
    // Returns all matches of a pattern
    //
    public func substrings(matching regex: String, options: String.CompareOptions = []) -> [Substring] {
        var options = options
        options.insert(.regularExpression)
        
        var result: [Substring] = []
        
        var range = startIndex..<endIndex
        while let foundRange = self.range(of: regex, options: options, range: range, locale: nil) {
            result.append(self[foundRange])
            range = foundRange.upperBound..<endIndex
        }
        
        return result
    }
    
    //
    // Returns all subpatterns of the first match
    //
    public func match(regex: String) throws -> [String]? {
        let regex = try NSRegularExpression(pattern: regex)
        let nsString = self as NSString
        
        guard let match = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length)).first
            else { return nil }
        
        var components:[String] = []
        for i in 0..<match.numberOfRanges {
            let range = match.range(at: i)
            if range.location == NSNotFound {
                components.append("")
            }
            else {
                components.append(nsString.substring(with: range) as String)
            }
        }
        
        return components
    }
}
