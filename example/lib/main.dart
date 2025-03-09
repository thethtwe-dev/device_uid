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

  @override
  void initState() {
    super.initState();
    getDeviceID();
  }

  Future getDeviceID() async {
    String? deviceId = await DeviceUid.getDeviceId() ?? 'N/A';
    setState(() {
      mydeviceid = deviceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: Text('Device ID : $mydeviceid')),
      ),
    );
  }
}
