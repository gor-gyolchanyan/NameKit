// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "NameKit",
    products: [
        .library(
            name: "NameKit",
            targets: ["NameKit"]
        ),
    ],
    targets: [
        .target(
            name: "NameKit"
        ),
        .testTarget(
            name: "NameKit.Test",
            dependencies: ["NameKit"]
        ),
    ]
)
