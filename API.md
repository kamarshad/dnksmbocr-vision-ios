# Public API surface

The authoritative declarations are the `.swiftinterface` files inside each released XCFramework. Supported entry points are `MQBVisionSDK`, `MQBVisionConfig`, `MQBScanInput`, `MQBScanResult`, `MQBVisionEngine`, `MQBLicenseVerifying`, `MQBTelemetrySink`, MQB-prefixed document/feature enums, quality reports, explainable risk outcomes and typed `MQBError` values.

Semantic-versioning policy: public declaration removal or source-breaking change requires a major version. Additive fields and enum cases require consumers to use unknown-safe handling.
