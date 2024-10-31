import 'package:ble_test/core/context_extensions.dart';
import 'package:ble_test/core/router/router.dart';
import 'package:ble_test/presentation/tokens/spacing.dart';
import 'package:ble_test/presentation/widgets/app_wrapper.dart';
import 'package:flutter/material.dart';

class SettingsLayout extends StatefulWidget {
  const SettingsLayout({super.key});

  @override
  State<SettingsLayout> createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends State<SettingsLayout> {
  final _uuidController = TextEditingController();
  final _bleNameController = TextEditingController();

  @override
  void dispose() {
    _bleNameController.dispose();
    _uuidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.s.settings)),
      body: AppWrapper(
        child: Column(
          children: [
            // В нормальном проекте текст филд я бы вынес как отдельный виджет
            TextField(
              controller: _bleNameController,
              decoration: InputDecoration(
                labelText: context.s.deviceLocalName,
                border: const OutlineInputBorder(),
              ),
            ),
            Spacings.spacer16,
            TextField(
              controller: _uuidController,
              decoration: InputDecoration(
                labelText: context.s.serviceUuids,
                border: const OutlineInputBorder(),
              ),
            ),
            Spacings.spacer16,
            ElevatedButton(
              onPressed: () {
                final bleName = _bleNameController.text;
                final uuid = _uuidController.text;

                context.r.replaceAll([MainRoute(bleName: bleName, uuid: uuid)]);
              },
              child: Text(context.s.save),
            ),
          ],
        ),
      ),
    );
  }
}
