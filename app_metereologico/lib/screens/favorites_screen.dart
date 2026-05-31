import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritos',
        ),
      ),
      body: ListView.builder(
        itemCount: provider.favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.star,
            ),
            title: Text(
              provider.favorites[index],
            ),
            onTap: () async {
              await context.read<WeatherProvider>().searchCity(
                    provider.favorites[index],
                  );

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          );
        },
      ),
    );
  }
}
