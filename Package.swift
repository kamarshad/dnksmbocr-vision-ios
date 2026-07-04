// swift-tools-version:5.7
import PackageDescription

let version = "0.1.0"
let checksum = "b69e4f915d663f16e399f7bd7495bbd68dcf3f667f3ae5c1deb2a704c7bb2499"

let package = Package(
    name: "DNKSMBOCRVision",
    platforms: [.iOS(.v14)],
    products: [.library(name: "DNKSMBOCRVision", targets: ["DNKSMBOCRVision"])],
    targets: [
        .binaryTarget(
            name: "DNKSMBOCRVision",
            url: "https://github.com/kamarshad/dnksmbocr-vision-ios/releases/download/\(version)/DNKSMBOCRVision.xcframework.zip",
            checksum: checksum
        )
    ]
)
