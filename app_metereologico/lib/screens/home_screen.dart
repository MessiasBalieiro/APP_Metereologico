import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../widgets/city_search.dart';
import '../widgets/weather_card.dart';
import '../widgets/forecast_chart.dart';
import '../widgets/weather_map.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            WeatherProvider>();

    return Scaffold(

      appBar: AppBar(
        title:
            const Text(
          'Clima Brasil',
        ),
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

              if (provider.forecasts
                  .isNotEmpty) ...[

                WeatherCard(
                  city:
                      provider.selectedCity,
                  forecast:
                      provider.forecasts
                          .first,
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
                  city:
                      provider.selectedCity,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}