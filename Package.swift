// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftToolbox",
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
    swiftLanguageVersions: [5]
)
