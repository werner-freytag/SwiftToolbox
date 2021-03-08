import Foundation

/// Reduce an angle in radians to the range (0 - 2π)
/// - Parameter radians: Angle in radians
/// - Returns: Reduced angle
public func normalizeRadians<T: FloatingPoint>(_ radians: T) -> T {
    normalizeArc(value: radians, max: .pi * 2)
}

/// Reduce an angle in radians to the range (0 - 360º)
/// - Parameter degrees: Angle in radians
/// - Returns: Reduced angle
public func normalizeDegrees<T: FloatingPoint>(_ degrees: T) -> T {
    normalizeArc(value: degrees, max: 360)
}

/// Reduce an angular value to a given range
/// - Parameter r: Angle in radians
/// - Returns: Reduced angle in radians
func normalizeArc<T: FloatingPoint>(value: T, max: T) -> T {
    switch value {
    case ..<(-max):
        return value + max * (floor(-value / max) + 1)
    case -max ..< 0:
        return value + max
    case 0 ..< max:
        return value
    default:
        return value - max * floor(value / max)
    }
}
