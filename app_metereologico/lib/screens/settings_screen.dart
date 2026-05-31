import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class SettingsScreen
    extends StatelessWidget {

  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text(
              'Tema Escuro',
            ),
            value: provider.darkMode,
            onChanged: (_) {
              provider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}