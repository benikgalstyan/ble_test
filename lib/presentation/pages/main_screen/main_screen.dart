import 'package:ble_test/presentation/pages/main_screen/bloc/controller_bloc.dart';
import 'package:ble_test/presentation/pages/main_screen/main_layout.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.bleName, required this.uuid});

  final String uuid;
  final String bleName;

  static const nameRoute = '/MainScreen';

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ControllerBloc(),
        child: MainLayout(uuid: uuid, bleName: bleName),
      );
}
