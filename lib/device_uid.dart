import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';

class DeviceUid {
  static const MethodChannel _channel = MethodChannel('device_uid');

  /// Returns Android ID (Android) or IDFV (iOS)
  static Future<String?> getDeviceId() async {
    try {
      final String? deviceId = await _channel.invokeMethod('getDeviceId');
      return deviceId;
    } catch (e) {
      log("Error getting device ID: $e", name: 'device_uid');
      return null;
    }
  }

  /// Returns a randomly generated UUID (not persistent)
  static Future<String?> getUUID() async {
    try {
      final String? uuid = await _channel.invokeMethod('getUUID');
      return uuid;
    } catch (e) {
      log("Error getting UUID: $e", name: 'device_uid');
      return null;
    }
  }

  /// Returns Advertising ID (Ad ID) if available
  static Future<String?> getAdId() async {
    try {
      final String? adId = await _channel.invokeMethod('getAdId');
      return adId;
    } catch (e) {
      log("Error getting Ad ID: $e", name: 'device_uid');
      return null;
    }
  }
}
