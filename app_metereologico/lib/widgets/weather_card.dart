import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/forecast_model.dart';
import '../providers/weather_provider.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final ForecastModel forecast;

  const WeatherCard({
    super.key,
    required this.city,
    required this.forecast,
  });

  IconData getWeatherIcon(
    String condition,
  ) {
    final text = condition.toLowerCase();

    if (text.contains('chuva')) {
      return Icons.cloudy_snowing;
    }

    if (text.contains('tempestade')) {
      return Icons.thunderstorm;
    }

    if (text.contains('sol')) {
      return Icons.wb_sunny;
    }

    if (text.contains('nublado')) {
      return Icons.cloud;
    }

    return Icons.cloud;
  }

  Color getWeatherColor(
    String condition,
  ) {
    final text = condition.toLowerCase();

    if (text.contains('chuva')) {
      return Colors.lightBlue.shade100;
    }

    if (text.contains('tempestade')) {
      return Colors.deepPurple.shade100;
    }

    if (text.contains('sol')) {
      return Colors.orange.shade100;
    }

    if (text.contains('nublado')) {
      return Colors.blueGrey.shade100;
    }

    return Colors.grey.shade100;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<WeatherProvider>();

    final isFavorite = provider.favorites.contains(city);

    return Card(
      color: Theme.of(context).brightness == Brightness.dark
      ? Theme.of(context).cardColor 
      : getWeatherColor(forecast.condition),

      elevation: 8,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          24,
        ),
        side: BorderSide(
          color: getWeatherColor(
            forecast.condition,
          ),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      city,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    size: 30,
                  ),
                  onPressed: () {
                    provider.addFavorite(
                      city,
                    );
                  },
                ),
              ],
            ),

            const SizedBox(
              height: 24,
            ),

            /// CLIMA
            Center(
              child: Column(
                children: [
                  Icon(
                    getWeatherIcon(
                      forecast.condition,
                    ),
                    size: 90,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    forecast.condition,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            /// TEMPERATURA PRINCIPAL
            Center(
              child: Text(
                '${forecast.maxTemp.toStringAsFixed(0)}°C',
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            /// MÍNIMA E MÁXIMA
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      '🌡 Mínima',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${forecast.minTemp.toStringAsFixed(0)}°C',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.black26,
                ),
                Column(
                  children: [
                    const Text(
                      '🔥 Máxima',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${forecast.maxTemp.toStringAsFixed(0)}°C',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 24,
            ),

            /// UV
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(
                14,
              ),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sunny,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Índice UV: ${forecast.uvIndex}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
