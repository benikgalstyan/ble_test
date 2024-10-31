import 'package:ble_test/presentation/pages/main_screen/bloc/controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusSwitch extends StatelessWidget {
  const StatusSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControllerBloc>().state;
    final isActive = state is ControllerActiveState;

    return Switch(
      value: isActive,
      onChanged: (value) {
        final bloc = context.read<ControllerBloc>();
        if (value) {
          bloc.add(
            StartDeviceEvent(
              clientId: 'test_client',
              aliveTimeout: 30,
              pauseTimeout: 10,
            ),
          );
        } else {
          bloc.add(StopDeviceEvent(clientId: 'test_client'));
        }
      },
    );
  }
}
