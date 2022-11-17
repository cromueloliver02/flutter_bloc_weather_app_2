part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final TempUnit tempUnit;

  const SettingState({required this.tempUnit});

  factory SettingState.initial() {
    return const SettingState(tempUnit: TempUnit.celcius);
  }

  @override
  List<Object> get props => [tempUnit];

  @override
  String toString() => 'SettingState(tempUnit: $tempUnit)';

  SettingState copyWith({
    TempUnit? tempUnit,
  }) {
    return SettingState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}

enum TempUnit { celcius, fahrenheit }
