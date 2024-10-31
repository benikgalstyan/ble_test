import 'package:flutter/material.dart';

class BleInfoDisplay extends StatelessWidget {
  const BleInfoDisplay({super.key, required this.bleName, required this.uuid});

  final String uuid;
  final String bleName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device Local Name: $bleName',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Service UUIDs: $uuid',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
