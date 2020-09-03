// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-xkcd-client",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "XKCDClient",
            targets: ["XKCDClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SouthwestKoala/swift-rest-client", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "XKCDClient",
            dependencies: [
                .product(name: "RESTClient", package: "swift-rest-client"),
            ]),
        .testTarget(
            name: "XKCDClientTests",
            dependencies: ["XKCDClient"]),
    ]
)
