// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftToolbox",
    platforms: [
        .macOS(.v10_10), .iOS(.v8)
    ],
    products: [
        .library(
            name: "SwiftToolbox",
            targets: ["SwiftToolbox"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "SwiftToolbox",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "SwiftToolboxTests",
            dependencies: ["SwiftToolbox", "Nimble"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
