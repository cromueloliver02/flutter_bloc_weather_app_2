import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';
import '../blocs/blocs.dart';
import '../models/weather.dart';
import '../utils/constants.dart';
import '../utils/functions.dart';
import './pages.dart';

class HomePage extends StatelessWidget {
  static const id = '/';

  const HomePage({super.key});

  void _goToSearchPage(BuildContext ctx) async {
    final weatherBloc = ctx.read<WeatherBloc>();
    final city = await Navigator.pushNamed(ctx, SearchPage.id) as String?;

    if (city != null) {
      weatherBloc.add(FetchWeatherEvent(city: city));
    }
  }

  void _goToSettingsPage(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        SettingsPage.id,
      );

  String _formatTemp(double temp) {
    return '$temp °C';
    // return '${(temp * 9 / 5) + 32} °F';
  }

  Widget _showIcon(String icon) => FadeInImage.assetNetwork(
        placeholder: 'assets/images/loading.gif',
        image: 'http://$kIconHost/img/wn/$icon@4x.png',
        width: 96,
        height: 96,
      );

  void _weatherListener(BuildContext ctx, WeatherState state) {
    if (state.status == WeatherStatus.error) {
      showErrorDialog(ctx, state.error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather You'),
        actions: [
          IconButton(
            onPressed: () => _goToSearchPage(context),
            iconSize: 30,
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => _goToSettingsPage(context),
            iconSize: 30,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: _weatherListener,
        builder: (ctx, state) {
          if (state.status == WeatherStatus.initial ||
              state.status == WeatherStatus.error) {
            return const Center(
              child: Text(
                'Select a city',
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          if (state.status == WeatherStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final Weather weather = state.weather;

          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    SizedBox(height: MediaQuery.of(context).size.height / 6),
                    Text(
                      weather.city,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TimeOfDay.fromDateTime(weather.lastUpdated)
                              .format(context),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '(${weather.country})',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _formatTemp(weather.temp),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              _formatTemp(weather.tempMax),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _formatTemp(weather.tempMin),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _showIcon(weather.icon),
                        const SizedBox(width: 20),
                        Text(
                          weather.description.titleCase,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
