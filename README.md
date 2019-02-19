## Partnerize App Tracking iOS framework.

[![CocoaPods](https://img.shields.io/badge/platform-ios-orange.svg)](https://cocoapods.org/pods/Partnerize)
[![Languages](https://img.shields.io/badge/languages-ObjC%20%7C%20%20Swift-orange.svg?maxAge=2592000)](https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios)
[![CocoaPods](https://img.shields.io/badge/pod-1.0.0-blue.svg)](https://cocoapods.org/pods/Partnerize)
[![carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios/blob/master/LICENSE)

## Installation

Partnerize App Tracking iOS framework supports iOS 11 and later.

### CocoaPods
Add the Partnerize pod into your Podfile and run `pod install`.

target :YourTargetName do
pod 'Partnerize'
end

### Carthage
1. Add `github "PerformanceHorizonGroup/partnerize-mobile-sdk-ios"` to your Cartfile.
2. Run carthage update.
3. Go to your Xcode project's "General" settings. Drag `Partnerize.framework` from `Carthage/Build/iOS` to the "Embedded Binaries" section. Make sure “Copy items if needed” is selected and click Finish.

### Manual Installation

1. [Download Partnerize for iOS](https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios/archive/master.zip) and extract the zip.
2. Go to your Xcode project's "General" settings. Drag `Partnerize.framework` to the "Embedded Binaries" section. Make sure "Copy items if needed" is selected and click Finish.
3. Create a new “Run Script Phase” in your app’s target’s “Build Phases” and paste the following snippet in the script test field:

bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/Partnerize.framework/strip-frameworks.sh"


## Example app
There is an example app provided [here](https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios/tree/master/SampleCode) for both Objective-C and Swift.

