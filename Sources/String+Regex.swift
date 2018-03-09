//
//  Copyright © 2017 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

extension String {
    func regexQuoted() -> String {
        return replacingOccurrences(of: "\\[|\\]|\\(|\\)|\\\\|\\*|\\+|\\?|\\{|\\}|\\^|\\$|\\.|\\||\\^|\\$",
                             with: "\\\\$0",
                             options: .regularExpression)
    }
}

