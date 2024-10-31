part of 'controller_bloc.dart';

@immutable
abstract class ControllerEvent {}

class ConnectDeviceEvent extends ControllerEvent {}

class StartDeviceEvent extends ControllerEvent {
  StartDeviceEvent({
    required this.clientId,
    required this.aliveTimeout,
    required this.pauseTimeout,
  });

  final String clientId;
  final int aliveTimeout;
  final int pauseTimeout;
}

class AliveEvent extends ControllerEvent {
  AliveEvent({required this.clientId});

  final String clientId;
}

class PauseDeviceEvent extends ControllerEvent {
  PauseDeviceEvent({required this.clientId});

  final String clientId;
}

class ContinueDeviceEvent extends ControllerEvent {
  ContinueDeviceEvent({required this.clientId});

  final String clientId;
}

class StopDeviceEvent extends ControllerEvent {
  StopDeviceEvent({required this.clientId});

  final String clientId;
}
