//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

/// Property wrapper that wraps a lazy value that can be reset
@propertyWrapper public class ResettableLazy<Value> {
    private enum State {
        case uninitialized
        case initialized(Value)
    }

    private var state: State = .uninitialized
    private let initializer: () -> Value

    /// Initializer for lazy creating a value
    public init(wrappedValue: @autoclosure @escaping () -> Value) {
        initializer = wrappedValue
    }

    /// The wrapped value
    public var wrappedValue: Value {
        get {
            switch state {
            case .uninitialized:
                let value = initializer()
                state = .initialized(value)
                return value
            case let .initialized(value):
                return value
            }
        }
        set {
            state = .initialized(newValue)
        }
    }

    /// Reset the value
    public func reset() {
        state = .uninitialized
    }
}
