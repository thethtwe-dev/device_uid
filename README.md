# device_uid

A Flutter plugin to get a unique device ID using native methods on Android and iOS.

## Features
- Retrieves **device unique ID** without third-party dependencies.
- Works on both **Android** and **iOS**.
- Supports **Advertising ID (Ad ID)** for tracking purposes.
- Includes a **generated UUID** as a fallback.

## Installation
Add this to your `pubspec.yaml`:
```yaml
dependencies:
  device_uid: ^latest
```

## Usage

#### Get Device Unique ID

Returns:

- Android: **ANDROID_ID**
- iOS: **IDFV (Identifier for Vendor)**

```
import 'package:device_uid/device_uid.dart';

void main() async {
  String deviceId = await DeviceUid.getDeviceId() ?? 'N/A';
  debugPrint("Device ID: $deviceId");
}
```

#### Get Advertising ID (Ad ID)
Returns:

- Android: **Advertising ID** (requires Google Play Services)
- iOS: **Advertising ID** (requires tracking permission on iOS 14+)

```
import 'package:device_uid/device_uid.dart';

void main() async {
  String adId = await DeviceUid.getAdId() ?? 'N/A';
  debugPrint("Ad ID: $adId");
}
```
🔹 iOS Tracking Permission Requirement (iOS 14+):
If running on iOS 14+, ensure you request App Tracking Transparency (ATT) permission before retrieving Ad ID.

#### Generate Random UUID (Fallback)
- Returns a randomly generated UUID that is not persistent.

```
import 'package:device_uid/device_uid.dart';

void main() async {
  String uuid = await DeviceUid.getUUID() ?? 'N/A';
  debugPrint("Generated UUID: $uuid");
}
```


| **Function**       | **Android**        | **iOS**       | **Persistent?** | **Notes** |
|--------------------|-------------------|--------------|----------------|-----------|
| `getDeviceId()`   | `ANDROID_ID`       | `IDFV`       | ✅ Yes         | Unique per device (or vendor on iOS). |
| `getAdId()`       | Advertising ID     | Advertising ID | ✅ Yes        | Requires Google Play Services (Android) / ATT permission (iOS). |
| `getUUID()`       | Random UUID        | Random UUID  | ❌ No         | Regenerates each time it's called. |

## ☕ Buy Me a Coffee

If you find this package useful, consider supporting me:

- **Binance Pay ID:** `523797881`

Thank you for your support! ❤️