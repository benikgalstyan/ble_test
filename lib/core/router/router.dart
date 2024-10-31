import 'package:ble_test/presentation/pages/main_screen/main_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ble_test/presentation/pages/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: MainRoute.page, path: MainScreen.nameRoute),
        AutoRoute(
          page: SettingsRoute.page,
          path: SettingsScreen.nameRoute,
          initial: true,
        ),
      ];
}
