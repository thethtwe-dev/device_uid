import 'package:flutter/material.dart';
import 'dart:async';
import 'package:device_uid/device_uid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mydeviceid = '';
  String adId = '';
  String uuID = '';

  @override
  void initState() {
    super.initState();
    getIds();
  }

  Future getIds() async {
    String? deviceId = await DeviceUid.getDeviceId() ?? 'N/A';
    String? uuid = await DeviceUid.getUUID() ?? 'N/A';
    String? adid = await DeviceUid.getAdId() ?? 'N/A';

    setState(() {
      mydeviceid = deviceId;
      adId = adid;
      uuID = uuid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Device ID : $mydeviceid\n'),
              Text('UUID : $uuID\n'),
              Text('Ad ID : $adId'),
            ],
          ),
        ),
      ),
    );
  }
}
