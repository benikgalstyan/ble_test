part of 'controller_bloc.dart';

@immutable
abstract class ControllerState {
  const ControllerState(this.statusText);

  final String statusText;
}

class ControllerIdleState extends ControllerState {
  const ControllerIdleState() : super('Waiting');
}

class ControllerActiveState extends ControllerState {
  const ControllerActiveState() : super('Activated');
}

class ControllerPausedState extends ControllerState {
  const ControllerPausedState() : super('Paused');
}

class ControllerErrorState extends ControllerState {
  const ControllerErrorState(this.error) : super('Error');
  final String error;
}
