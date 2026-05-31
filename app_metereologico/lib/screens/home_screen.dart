import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

import '../widgets/city_search.dart';
import '../widgets/weather_card.dart';
import '../widgets/forecast_chart.dart';
import '../widgets/weather_map.dart';

import 'favorites_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  @override
  void initState() {

    super.initState();

    Future.microtask(() {

      final provider =
          context.read<WeatherProvider>();

      provider.loadTheme();

      provider.loadFavorites();

      provider.loadCurrentCity();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<WeatherProvider>();

    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
          'Clima Brasil',
        ),

        actions: [

          IconButton(

            icon:
                const Icon(
              Icons.history,
            ),

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const HistoryScreen(),
                ),
              );
            },
          ),

          IconButton(

            icon:
                const Icon(
              Icons.star,
            ),

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const FavoritesScreen(),
                ),
              );
            },
          ),

          IconButton(

            icon:
                const Icon(
              Icons.settings,
            ),

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(

        child: Padding(

          padding:
              const EdgeInsets.all(
            16,
          ),

          child: Column(

            children: [

              const CitySearch(),

              const SizedBox(
                height: 20,
              ),

              if (provider.loading)
                const CircularProgressIndicator(),

              if (!provider.loading &&
                  provider.forecasts.isEmpty)

                const Padding(
                  padding:
                      EdgeInsets.all(24),
                  child: Text(
                    'Pesquise uma cidade ou aguarde a localização automática.',
                  ),
                ),

              if (provider.forecasts
                  .isNotEmpty) ...[

                WeatherCard(
                  city:
                      provider.selectedCity,
                  forecast:
                      provider.forecasts.first,
                ),

                const SizedBox(
                  height: 20,
                ),

                ForecastChart(
                  forecasts:
                      provider.forecasts,
                ),

                const SizedBox(
                  height: 20,
                ),

                WeatherMap(
                  latitude:
                      provider.currentLatitude,
                  longitude:
                      provider.currentLongitude,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}