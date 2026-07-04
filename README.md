# DNKSMBOCR Vision SDK for iOS

Privacy-focused document capture and OCR SDK for iOS, distributed as a compiled XCFramework through Swift Package Manager.

> **Developer Preview:** Version `0.1.0` establishes the SDK contracts, licensing boundary, quality policies, and binary distribution pipeline. Production document models and country coverage are supplied only in validated commercial releases.

## Overview

DNKSMBOCR Vision helps iOS applications integrate document-intelligence workflows without exposing proprietary implementation source. It is designed for regulated onboarding use cases in banking, fintech, telecommunications, insurance, travel, and government services.

The SDK architecture supports:

- Document capture orchestration
- Structured OCR results
- Field-level confidence
- Image-quality assessment
- Retry and manual-review decisions
- Typed, recoverable errors
- Explainable risk outcomes
- Feature-based commercial licensing
- Privacy-safe telemetry hooks
- Replaceable on-device or private processing engines

Planned commercial modules include MRZ, barcode, NFC, document consistency, face extraction, liveness, fraud signals, and secure payment-card capture. Availability depends on the purchased licence and release version.

## Requirements

- iOS 14 or newer
- Xcode 14.2 or newer
- Swift 5.7 or newer
- A DNKSMBOCR licence bound to the application's bundle identifier
- Camera usage description when the hosted capture module is enabled

## Installation with Swift Package Manager

In Xcode:

1. Select **File → Add Package Dependencies**.
2. Enter:

   ```text
   https://github.com/kamarshad/dnksmbocr-vision-ios.git
   ```

3. Select an exact released version.
4. Add `DNKSMBOCRVision` to the application target.

Or add it to `Package.swift`:

```swift
dependencies: [
    .package(
        url: "https://github.com/kamarshad/dnksmbocr-vision-ios.git",
        exact: "0.1.0"
    )
]
```

The package manifest downloads the versioned XCFramework from GitHub Releases. Swift Package Manager verifies the declared checksum before integration.

## Basic integration

```swift
import DNKSMBOCRVision

let config = MQBVisionConfig(
    documentType: .emiratesID,
    scanMode: .frontAndBack,
    processingMode: .onDevice,
    minimumConfidence: 0.90,
    requiredFeatures: [.capture, .ocr]
)

let sdk = try MQBVisionSDK(
    licenseEnvelope: licenceData,
    appId: Bundle.main.bundleIdentifier!,
    verifier: productionLicenceVerifier,
    engine: productionVisionEngine
)

let result = try await sdk.scan(
    MQBScanInput(bytes: capturedJPEG),
    config: config
)

switch result.risk.outcome {
case .accept:
    // Continue the onboarding journey.
case .retry:
    // Show the recommended capture correction.
case .manualReview:
    // Route uncertain fields for review.
case .reject, .undetermined:
    // Follow the customer's risk policy.
}
```

Production engine and licence-verifier implementations are provided according to the customer's commercial deployment agreement.

## Licence handling

Licences are bound to bundle identifiers, platforms, environments, validity periods, and enabled modules. Do not commit licence files to source control or include them in logs, analytics, screenshots, support tickets, or sample applications.

Client-side licensing protects normal commercial distribution but cannot prevent every determined attack. Authoritative quotas, revocation, contract enforcement, and sensitive risk policy should remain server-controlled.

## Privacy and security

- On-device processing is the preferred default.
- Images and extracted values are not intended for analytics.
- The SDK telemetry contract accepts operational event names and non-PII attributes only.
- Network processing must be explicitly configured by the host application.
- Released framework slices include an Apple privacy manifest.
- Customer applications remain responsible for consent, camera permission text, retention policy, and applicable regulatory obligations.

Do not place document images, document numbers, MRZ data, customer licences, secrets, or personal information in GitHub issues.

## Binary distribution and source protection

The release contains compiled device and simulator slices plus public `.swiftinterface` declarations required by the Swift compiler. It excludes implementation source, private interfaces, source-information records, ABI metadata, source maps, and debug symbols.

Compiled binaries can still be analyzed. No mobile SDK can make reverse engineering impossible. Secrets, signing keys, authoritative licence decisions, model distribution controls, and sensitive fraud rules must therefore remain outside the customer binary.

## Public API and compatibility

The `.swiftinterface` inside each XCFramework is the authoritative public declaration. DNKSMBOCR follows semantic versioning:

- Patch: backward-compatible fixes
- Minor: backward-compatible capabilities
- Major: source- or behavior-breaking public API changes

Pin production applications to an exact tested SDK version and review release notes before upgrading.

## Troubleshooting

### Package checksum mismatch

Clear Xcode package caches and confirm that the selected tag and release asset match. Published release assets are immutable; a corrected binary receives a new patch version.

### Licence rejected

Confirm the bundle identifier, platform, environment, validity period, device time, and purchased module entitlements. Never post the licence publicly.

### Module cannot be imported

Confirm `DNKSMBOCRVision` is linked to the correct application target and that the deployment target is iOS 14 or newer.

## Support and security

Use the commercial support channel supplied with your agreement. For security vulnerabilities, follow [SECURITY.md](SECURITY.md). Public GitHub issues must contain no customer data, document images, licences, keys, or confidential implementation details.

## Licence

DNKSMBOCR Vision SDK is proprietary software. Viewing this repository does not grant a commercial SDK licence. See [LICENSE](LICENSE) and the applicable commercial agreement.

Copyright © 2026 DNKSMBOCR. All rights reserved.
