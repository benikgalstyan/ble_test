import 'package:ble_test/core/context_extensions.dart';
import 'package:ble_test/presentation/pages/main_screen/bloc/controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateSpecificButton extends StatelessWidget {
  const StateSpecificButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControllerBloc>().state;
    final bloc = context.read<ControllerBloc>();

    if (state is ControllerActiveState) {
      return ElevatedButton(
        onPressed: () => bloc.add(PauseDeviceEvent(clientId: 'test_client')),
        child: Text(context.s.pause),
      );
    } else if (state is ControllerPausedState) {
      return ElevatedButton(
        onPressed: () => bloc.add(ContinueDeviceEvent(clientId: 'test_client')),
        child: Text(context.s.next),
      );
    } else if (state is ControllerErrorState) {
      return Text(
        'Error: ${state.error}',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.red,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
