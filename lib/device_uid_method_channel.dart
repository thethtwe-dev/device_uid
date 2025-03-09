import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_uid_platform_interface.dart';

/// An implementation of [DeviceUidPlatform] that uses method channels.
class MethodChannelDeviceUid extends DeviceUidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_uid');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
