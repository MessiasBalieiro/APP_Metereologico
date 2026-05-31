import 'package:flutter/material.dart';

import '../models/forecast_model.dart';

class WeatherCard
    extends StatelessWidget {

  final String city;

  final ForecastModel forecast;

  const WeatherCard({
    super.key,
    required this.city,
    required this.forecast,
  });

  @override
  Widget build(
      BuildContext context) {

    return Card(

      elevation: 3,

      child: Padding(

        padding:
            const EdgeInsets.all(
          16,
        ),

        child: Column(

          children: [

            Text(
              city,
              style:
                  const TextStyle(
                fontSize: 24,
              ),
            ),

            Text(
              forecast.condition,
            ),

            Text(
              "Min: ${forecast.minTemp}°C",
            ),

            Text(
              "Max: ${forecast.maxTemp}°C",
            ),
          ],
        ),
      ),
    );
  }
}