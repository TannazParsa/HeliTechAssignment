// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Utility",
            targets: ["Utility"]),
        .library(
            name: "Networking",
            targets: ["Networking"]),
        .library(
            name: "Models",
            targets: ["Models"]),
        .library(
            name: "Service",
            targets: ["Service"]),
        .library(
            name: "ListFeature",
            targets: ["ListFeature"]),
        .library(
            name: "MapFeature",
            targets: ["MapFeature"]),

    ],
    dependencies: [
            .package(
                url: "https://github.com/pointfreeco/swift-composable-architecture",
                from: "0.9.0"),
        ],
    targets: [
      .target(
          name: "MapFeature",
          dependencies: [.product(name: "ComposableArchitecture",
                                  package: "swift-composable-architecture")]),
        .target(
            name: "Utility",
            dependencies: []),
        .target(
            name: "Networking",
            dependencies: ["Utility"]),
        .target(
            name: "Models",
            dependencies: []),
        .target(
            name: "Service",
            dependencies: ["Networking", "Models"]),
        .target(
            name: "ListFeature",
            dependencies: ["Models",
                            "Service",
                            .product(name: "ComposableArchitecture",
                                     package: "swift-composable-architecture")])
    ]
)
