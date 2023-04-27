// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-sandbox",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(
            name: "sandbox",
            targets: ["swift-sandbox"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "swift-sandbox"),
        .testTarget(
            name: "swift-sandboxTests",
            dependencies: ["swift-sandbox"]),
    ]
)
