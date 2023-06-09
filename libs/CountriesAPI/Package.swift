// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "CountriesAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "CountriesAPI", targets: ["CountriesAPI"]),
    .library(name: "CountriesAPITestMocks", targets: ["CountriesAPITestMocks"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "CountriesAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
    .target(
      name: "CountriesAPITestMocks",
      dependencies: [
        .product(name: "ApolloTestSupport", package: "apollo-ios"),
        .target(name: "CountriesAPI"),
      ],
      path: "./TestMocks"
    ),
  ]
)
