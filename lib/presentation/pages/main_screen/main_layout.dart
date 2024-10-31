import 'package:ble_test/core/context_extensions.dart';
import 'package:ble_test/presentation/tokens/spacing.dart';
import 'package:ble_test/presentation/widgets/app_wrapper.dart';
import 'package:ble_test/presentation/widgets/state_specific_button.dart';
import 'package:ble_test/presentation/widgets/status_switch.dart';
import 'package:ble_test/presentation/widgets/status_text.dart';
import 'package:ble_test/presentation/widgets/stop_button.dart';
import 'package:ble_test/presentation/widgets/ble_info_display.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.bleName, required this.uuid});

  final String bleName;
  final String uuid;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text(context.s.restnowEmulator)),
        ),
        body: AppWrapper(
          child: Center(
            child: Center(
              child: Column(
                children: [
                  BleInfoDisplay(uuid: uuid, bleName: bleName),
                  Spacings.spacer64,
                  const StatusText(),
                  Spacings.spacer16,
                  const StatusSwitch(),
                  Spacings.spacer16,
                  const StateSpecificButton(),
                  Spacings.spacer16,
                  const StopButton(),
                ],
              ),
            ),
          ),
        ),
      );
}
