import 'package:ble_test/core/context_extensions.dart';
import 'package:ble_test/presentation/pages/main_screen/bloc/controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopButton extends StatelessWidget {
  const StopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context
            .read<ControllerBloc>()
            .add(StopDeviceEvent(clientId: 'test_client'));
      },
      child: Text(context.s.stop),
    );
  }
}
