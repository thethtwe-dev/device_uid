package com.thethtwe.device_uid

import android.content.Context
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.google.android.gms.ads.identifier.AdvertisingIdClient
import java.util.UUID
import kotlin.concurrent.thread

class DeviceUidPlugin: FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "device_uid")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "getDeviceId" -> {
                val androidId = Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
                result.success(androidId)
            }
            "getUUID" -> {
                val uuid = UUID.randomUUID().toString()
                result.success(uuid)
            }
            "getAdId" -> {
                thread {
                    try {
                        val adInfo = AdvertisingIdClient.getAdvertisingIdInfo(context)
                        result.success(adInfo.id)
                    } catch (e: Exception) {
                        result.error("AD_ID_ERROR", "Failed to get Ad ID", e.message)
                    }
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
