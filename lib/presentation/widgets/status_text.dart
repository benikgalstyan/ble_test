import 'package:ble_test/presentation/pages/main_screen/bloc/controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusText extends StatelessWidget {
  const StatusText({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControllerBloc>().state;
    return Text(
      'State: ${state.statusText}',
      style: const TextStyle(fontSize: 20),
    );
  }
}
