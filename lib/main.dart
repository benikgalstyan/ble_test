import 'package:ble_test/ble_test_app.dart';
import 'package:ble_test/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServicesLocator();
  runApp(BleTestApp());
}
