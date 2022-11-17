import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../blocs/blocs.dart';
import '../repositories/weather_repository.dart';
import '../services/weather_api_service.dart';

class BlocsHandler {
  final List<RepositoryProvider> repositoryProviders = [
    RepositoryProvider<WeatherRepository>(
      create: (ctx) => WeatherRepository(
        weatherApiService: WeatherApiService(httpClient: http.Client()),
      ),
    ),
  ];

  final List<BlocProvider> blocProviders = [
    BlocProvider<WeatherBloc>(
      create: (ctx) => WeatherBloc(
        weatherRepository: ctx.read<WeatherRepository>(),
      ),
    ),
    BlocProvider<ThemeBloc>(
      create: (ctx) => ThemeBloc(
        weatherBloc: ctx.read<WeatherBloc>(),
      ),
    ),
  ];
}
