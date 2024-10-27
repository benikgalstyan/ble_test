import 'package:change/change_app.dart';
import 'package:change/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServicesLocator();
  runApp(changeApp());
}
