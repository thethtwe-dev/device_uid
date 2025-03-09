# device_uid

A Flutter plugin to get a unique device ID using native methods on Android and iOS.

## Features
- Retrieves device unique ID without third-party dependencies.
- Works on both Android and iOS.

## Installation
Add this to your `pubspec.yaml`:
```yaml
dependencies:
  device_uid: ^1.0.0
```

# Get Started

``` 
import 'package:device_uid/device_uid.dart';

void main() {
  String? deviceId = await DeviceUid.getDeviceId() ?? 'N/A';
  debugPrint(deviceId);
}
```
