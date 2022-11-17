import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const id = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          ListTile(
            title: const Text('Temperature Unit'),
            subtitle: const Text('Temperature Unit'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
