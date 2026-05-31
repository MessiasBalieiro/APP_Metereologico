import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/forecast_model.dart';

class ForecastChart extends StatelessWidget {
  final List<ForecastModel> forecasts;

  const ForecastChart({
    super.key,
    required this.forecasts,
  });

  String getWeekDay(
    String date,
    int index,
  ) {
    if (index == 0) {
      return 'Hoje';
    }

    try {
      final parsed = DateTime.parse(date);

      const dias = [
        'Seg',
        'Ter',
        'Qua',
        'Qui',
        'Sex',
        'Sáb',
        'Dom',
      ];

      return dias[parsed.weekday - 1];
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (forecasts.isEmpty) {
      return const SizedBox();
    }

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            const Text(
              'Temperatura da Semana',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.circle,
                  size: 12,
                  color: Colors.red,
                ),
                SizedBox(width: 6),
                Text('Máxima'),
                SizedBox(width: 24),
                Icon(
                  Icons.circle,
                  size: 12,
                  color: Colors.blue,
                ),
                SizedBox(width: 6),
                Text('Mínima'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: (forecasts.length - 1).toDouble(),
                  gridData: FlGridData(
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: theme.colorScheme.surface,
                      width: 1.5,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        interval: 1,
                        getTitlesWidget: (
                          value,
                          meta,
                        ) {
                          final index = value.toInt();

                          if (index < 0 || index >= forecasts.length) {
                            return const SizedBox();
                          }

                          final label = getWeekDay(
                            forecasts[index].date,
                            index,
                          );

                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                            ),
                            child: Text(
                              label,
                              style: TextStyle(
                                fontWeight: index == 0
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    /// MÁXIMA
                    LineChartBarData(
                      color: Colors.red,
                      isCurved: true,
                      barWidth: 3,
                      dotData: FlDotData(
                        show: true,
                      ),
                      spots: forecasts
                          .asMap()
                          .entries
                          .map(
                            (
                              e,
                            ) =>
                                FlSpot(
                              e.key.toDouble(),
                              e.value.maxTemp,
                            ),
                          )
                          .toList(),
                    ),

                    /// MÍNIMA
                    LineChartBarData(
                      color: Colors.blue,
                      isCurved: true,
                      barWidth: 3,
                      dotData: FlDotData(
                        show: true,
                      ),
                      spots: forecasts
                          .asMap()
                          .entries
                          .map(
                            (
                              e,
                            ) =>
                                FlSpot(
                              e.key.toDouble(),
                              e.value.minTemp,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
