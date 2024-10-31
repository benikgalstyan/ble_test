import 'package:auto_route/annotations.dart';
import 'package:ble_test/presentation/pages/settings_screen/settings_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  static const nameRoute = '/SettingsScreen';

  @override
  Widget build(BuildContext context) => const SettingsLayout();
}
