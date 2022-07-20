//
//  Copyright © 2022 Werner Freytag. All rights reserved.
//

import Foundation

@propertyWrapper
public class ResettableLazy<Value> {
    private enum State {
        case uninitialized
        case initialized(Value)
    }

    private var state: State = .uninitialized
    private let initializer: () -> Value

    public init(wrappedValue: @autoclosure @escaping () -> Value) {
        initializer = wrappedValue
    }

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

    public func reset() {
        state = .uninitialized
    }
}
