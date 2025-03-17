import Flutter
import UIKit
import AdSupport
import AppTrackingTransparency

public class DeviceUidPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "device_uid", binaryMessenger: registrar.messenger())
        let instance = DeviceUidPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getDeviceId":
            if let identifier = UIDevice.current.identifierForVendor?.uuidString {
                result(identifier)
            } else {
                result(FlutterError(code: "UNAVAILABLE", message: "Device ID not available", details: nil))
            }
        case "getUUID":
            let uuid = UUID().uuidString
            result(uuid)
        case "getAdId":
            requestTrackingPermission { granted in
                if granted {
                    let adId = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                    result(adId)
                } else {
                    result(FlutterError(code: "PERMISSION_DENIED", message: "Tracking permission denied", details: nil))
                }
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func requestTrackingPermission(completion: @escaping (Bool) -> Void) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                completion(status == .authorized)
            }
        } else {
            completion(ASIdentifierManager.shared().isAdvertisingTrackingEnabled)
        }
    }
}
