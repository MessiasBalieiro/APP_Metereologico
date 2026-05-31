import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/forecast_model.dart';

class ForecastList extends StatelessWidget {
  final List<ForecastModel> forecasts;

  const ForecastList({
    super.key,
    required this.forecasts,
  });

  String formatDate(String date) {
    try {
      final parsed = DateTime.parse(date);

      return DateFormat(
        'dd/MM/yyyy',
      ).format(parsed);
    } catch (_) {
      return date;
    }
  }

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

    return Column(
      children: forecasts.map(
        (forecast) {
          return Card(
            color: Theme.of(context).brightness == Brightness.dark
                ? theme.colorScheme.surfaceContainerHighest
                : getWeatherColor(
                    forecast.condition,
                  ),
            margin: const EdgeInsets.only(
              bottom: 14,
            ),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                18,
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
                18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        getWeatherIcon(
                          forecast.condition,
                        ),
                        size: 42,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              forecast.condition,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatDate(
                                forecast.date,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
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
                        height: 50,
                        width: 1,
                        color: theme.dividerColor,
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
                    height: 18,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(
                      12,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Row(
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
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
