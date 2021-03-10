import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:imei_imsi_plugin/imei_imsi_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformImei = 'Unknown';
  String uniqueId = "Unknown";
  String _platformImsi = "Unknown";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformImei;
    String platformImsi;

    String idunique;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformImei = await ImeiImsiPlugin.getImei(
          shouldShowRequestPermissionRationale: false);
      platformImsi = await ImeiImsiPlugin.getImsi(
          shouldShowRequestPermissionRationale: false);
      List<String> multiImei = await ImeiImsiPlugin.getImeiMulti();
      print(multiImei);
      idunique = await ImeiImsiPlugin.getId();
    } on PlatformException {
      platformImei = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformImei = platformImei;
      _platformImsi = platformImsi;
      uniqueId = idunique;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
              'Running on\n imei : $_platformImei\n  uniqueId  : $uniqueId \n  imsi  : $_platformImsi'),
        ),
      ),
    );
  }
}