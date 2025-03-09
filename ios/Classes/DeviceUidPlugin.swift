import Flutter
import UIKit

public class DeviceUidPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "device_uid", binaryMessenger: registrar.messenger())
        let instance = DeviceUidPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getDeviceId" {
            if let identifier = UIDevice.current.identifierForVendor?.uuidString {
                result(identifier)
            } else {
                result(FlutterError(code: "UNAVAILABLE", message: "Device ID not available", details: nil))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
