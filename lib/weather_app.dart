import 'package:flutter/material.dart';

import 'pages/pages.dart';
import './utils/routes_handler.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  final _routesHandler = RoutesHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Weather App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      initialRoute: HomePage.id,
      routes: _routesHandler.routes,
    );
  }
}
