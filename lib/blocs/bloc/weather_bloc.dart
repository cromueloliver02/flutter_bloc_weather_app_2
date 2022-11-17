import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/weather.dart';
import '../../models/custom_error.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState.initial()) {
    on<FetchWeatherEvent>(_fetchWeather);
  }

  void _fetchWeather(FetchWeatherEvent event, Emitter<WeatherState> emit) {}
}
