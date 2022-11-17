import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState.initial()) {
    on<ToggleTempUnitEvent>(_toggleTempUnit);
  }

  void _toggleTempUnit(
    ToggleTempUnitEvent event,
    Emitter<SettingState> emit,
  ) {
    final tempUnit = state.tempUnit == TempUnit.celcius
        ? TempUnit.fahrenheit
        : TempUnit.celcius;

    emit(state.copyWith(tempUnit: tempUnit));
  }
}
