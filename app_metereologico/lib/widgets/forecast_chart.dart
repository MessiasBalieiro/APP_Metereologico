import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/forecast_model.dart';

class ForecastChart
    extends StatelessWidget {

  final List<ForecastModel>
      forecasts;

  const ForecastChart({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(
      BuildContext context) {

    return SizedBox(

      height: 300,

      child: LineChart(

        LineChartData(

          lineBarsData: [

            LineChartBarData(

              spots: forecasts
                  .asMap()
                  .entries
                  .map(
                    (entry) {

                  return FlSpot(
                    entry.key
                        .toDouble(),
                    entry.value
                        .maxTemp,
                  );

                }).toList(),
            )
          ],
        ),
      ),
    );
  }
}