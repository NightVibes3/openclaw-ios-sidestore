// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "OpenClawKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "OpenClawProtocol", targets: ["OpenClawProtocol"]),
        .library(name: "OpenClawKit", targets: ["OpenClawKit"]),
        .library(name: "OpenClawChatUI", targets: ["OpenClawChatUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "OpenClawProtocol",
            path: "Sources/OpenClawProtocol"),
        .target(
            name: "OpenClawKit",
            dependencies: [
                "OpenClawProtocol",
            ],
            path: "Sources/OpenClawKit",
            resources: [
                .process("Resources"),
            ]),
        .target(
            name: "OpenClawChatUI",
            dependencies: [
                "OpenClawKit",
            ],
            path: "Sources/OpenClawChatUI"),
        .testTarget(
            name: "OpenClawKitTests",
            dependencies: ["OpenClawKit", "OpenClawChatUI"],
            path: "Tests/OpenClawKitTests"),
    ])
