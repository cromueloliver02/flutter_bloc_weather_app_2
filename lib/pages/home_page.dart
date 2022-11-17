import 'package:flutter/material.dart';
import './pages.dart';

class HomePage extends StatelessWidget {
  static const id = '/';

  const HomePage({super.key});

  void _goToSearchPage(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        SearchPage.id,
      );

  void _goToSettingsPage(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        SettingsPage.id,
      );

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
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(height: MediaQuery.of(context).size.height / 6),
                const Text(
                  'Baguio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  '12:15 AM (PH)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '17.5 C',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: const [
                        Text(
                          '15.25 C',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '18.45 C',
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
                  children: const [
                    SizedBox.square(
                      dimension: 75,
                      child: Placeholder(),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Clear Sky',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
      ),
    );
  }
}
