import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'pages/pages.dart';
import './utils/blocs_handler.dart';
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
        child: BlocSelector<ThemeBloc, ThemeState, AppTheme>(
          selector: (state) => state.appTheme,
          builder: (ctx, appTheme) => MaterialApp(
            title: 'Bloc Weather App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode:
                appTheme == AppTheme.light ? ThemeMode.light : ThemeMode.dark,
            initialRoute: HomePage.id,
            routes: _routesHandler.routes,
          ),
        ),
      ),
    );
  }
}
