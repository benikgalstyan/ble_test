import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'controller_event.dart';

part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  ControllerBloc() : super(const ControllerIdleState()) {
    on<StartDeviceEvent>(_onStartDevice);
    on<AliveEvent>(_onAlive);
    on<PauseDeviceEvent>(_onPauseDevice);
    on<ContinueDeviceEvent>(_onContinueDevice);
    on<StopDeviceEvent>(_onStopDevice);
  }

  String? _currentClientId;
  int? _aliveTimeout;
  int? _pauseTimeout;
  Timer? _aliveTimer;
  Timer? _pauseTimer;

  void _onStartDevice(StartDeviceEvent event, Emitter<ControllerState> emit) {
    if (state is ControllerIdleState) {
      _currentClientId = event.clientId;
      _aliveTimeout = event.aliveTimeout;
      _pauseTimeout = event.pauseTimeout;
      _resetAliveTimer(emit);
      emit(const ControllerActiveState());
    }
  }

  void _onAlive(AliveEvent event, Emitter<ControllerState> emit) {
    if (event.clientId == _currentClientId) {
      _resetAliveTimer(emit);
    } else {
      emit(
        const ControllerErrorState(
          'Incorrect client ID for Alive',
        ),
      );
    }
  }

  void _onPauseDevice(PauseDeviceEvent event, Emitter<ControllerState> emit) {
    if (event.clientId == _currentClientId) {
      _pauseTimer?.cancel();
      _pauseTimer = Timer(Duration(seconds: _pauseTimeout ?? 0), () {
        emit(const ControllerIdleState());
      });
      emit(const ControllerPausedState());
    } else {
      emit(
        const ControllerErrorState(
          'Incorrect client ID for Pause',
        ),
      );
    }
  }

  void _onContinueDevice(
    ContinueDeviceEvent event,
    Emitter<ControllerState> emit,
  ) {
    if (event.clientId == _currentClientId && state is ControllerPausedState) {
      emit(const ControllerActiveState());
      _resetAliveTimer(emit);
    } else {
      emit(
        const ControllerErrorState(
          'Incorrect client ID or status for Continue',
        ),
      );
    }
  }

  void _onStopDevice(StopDeviceEvent event, Emitter<ControllerState> emit) {
    if (event.clientId == _currentClientId) {
      emit(const ControllerIdleState());
      _cancelTimers();
    } else {
      emit(
        const ControllerErrorState(
          'Incorrect client ID for Stop',
        ),
      );
    }
  }

  void _resetAliveTimer(Emitter<ControllerState> emit) {
    _aliveTimer?.cancel();
    _aliveTimer = Timer(Duration(seconds: _aliveTimeout ?? 0), () {
      emit(const ControllerIdleState());
    });
  }

  void _cancelTimers() {
    _aliveTimer?.cancel();
    _pauseTimer?.cancel();
  }

  @override
  Future<void> close() {
    _cancelTimers();
    return super.close();
  }
}
