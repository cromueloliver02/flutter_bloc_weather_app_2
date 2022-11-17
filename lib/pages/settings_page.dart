import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';

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
            subtitle: const Text('Celcius/Fahrenheit (Default: Celcius)'),
            trailing: BlocSelector<SettingBloc, SettingState, TempUnit>(
              selector: (state) => state.tempUnit,
              builder: (ctx, tempUnit) => Switch(
                value: tempUnit == TempUnit.celcius,
                onChanged: (value) =>
                    ctx.read<SettingBloc>().add(ToggleTempUnitEvent()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
