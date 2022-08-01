// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Partnerize",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PartnerizeSDK",
            targets: ["PartnerizeSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "PartnerizeSDK",
            url: "https://github.com/adimobile/partnerize-mobile-sdk-ios/releases/download/2.1.0/PartnerizeSDK.zip",
            checksum: "10562ee3e4851bfcfbfc536edb93b39798fbeb5631f25de2957c311ac1bd45a4"
        )
    ]
)
