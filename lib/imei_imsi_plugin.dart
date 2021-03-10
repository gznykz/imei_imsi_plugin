import 'dart:async';

import 'package:flutter/services.dart';

class ImeiImsiPlugin {
  static const MethodChannel _channel = const MethodChannel('imei_imsi_plugin');

  static Future<String> getImei(
      {bool shouldShowRequestPermissionRationale = false}) async {
    final String imei = await _channel.invokeMethod(
        'getImei', {"ssrpr": shouldShowRequestPermissionRationale});
    return imei;
  }

  static Future<String> getImsi(
      {bool shouldShowRequestPermissionRationale = false}) async {
    final String imei = await _channel.invokeMethod(
        'getImsi', {"ssrpr": shouldShowRequestPermissionRationale});
    return imei;
  }

  // get multi imei numbers (dual-sim, tri-sim) @return List<String>
  static Future<List<String>> getImeiMulti(
      {bool shouldShowRequestPermissionRationale = false}) async {
    final List<String> imeis = await _channel.invokeListMethod(
        'getImeiMulti', {"ssrpr": shouldShowRequestPermissionRationale});
    return imeis;
  }

  static Future<String> getId() async {
    return await _channel.invokeMethod('getId');
  }
}
