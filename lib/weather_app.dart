import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/pages.dart';
import '../utils/blocs_handler.dart';
import './utils/routes_handler.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  final _blocsHandler = BlocsHandler();
  final _routesHandler = RoutesHandler();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: _blocsHandler.repositoryProviders,
      child: MultiBlocProvider(
        providers: _blocsHandler.blocProviders,
        child: MaterialApp(
          title: 'Bloc Weather App',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          initialRoute: HomePage.id,
          routes: _routesHandler.routes,
        ),
      ),
    );
  }
}
