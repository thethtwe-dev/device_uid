import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_uid_method_channel.dart';

abstract class DeviceUidPlatform extends PlatformInterface {
  /// Constructs a DeviceUidPlatform.
  DeviceUidPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceUidPlatform _instance = MethodChannelDeviceUid();

  /// The default instance of [DeviceUidPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceUid].
  static DeviceUidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceUidPlatform] when
  /// they register themselves.
  static set instance(DeviceUidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
