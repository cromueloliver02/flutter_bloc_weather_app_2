import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app_2/blocs/weather/weather_bloc.dart';
import 'package:weather_app_2/utils/constants.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  late final StreamSubscription weatherSubscription;
  final WeatherBloc weatherBloc;

  ThemeBloc({
    required this.weatherBloc,
  }) : super(ThemeState.initial()) {
    weatherSubscription = weatherBloc.stream.listen(
      (state) => add(SetThemeEvent(temperature: state.weather.temp)),
    );

    on<SetThemeEvent>(_setTheme);
  }

  @override
  Future<void> close() {
    weatherSubscription.cancel();
    return super.close();
  }

  void _setTheme(SetThemeEvent event, Emitter<ThemeState> emit) {
    final appTheme =
        event.temperature > kWarmOrNot ? AppTheme.light : AppTheme.dark;

    emit(state.copyWith(appTheme: appTheme));
  }
}
