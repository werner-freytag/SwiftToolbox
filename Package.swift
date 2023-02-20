// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftToolbox",
    platforms: [
        .macOS(.v10_10), .iOS(.v13), .watchOS(.v6), .tvOS(.v9),
    ],
    products: [
        .library(
            name: "SwiftToolbox",
            targets: ["SwiftToolbox"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftToolbox",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftToolboxTests",
            dependencies: ["SwiftToolbox"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
