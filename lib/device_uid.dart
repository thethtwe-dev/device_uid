import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DeviceUid {
  static const MethodChannel _channel = MethodChannel('device_uid');

  static Future<String?> getDeviceId() async {
    try {
      final String? deviceId = await _channel.invokeMethod('getDeviceId');
      return deviceId;
    } on PlatformException catch (e) {
      debugPrint("Failed to get device ID: '${e.message}'.");
      return null;
    }
  }
}
