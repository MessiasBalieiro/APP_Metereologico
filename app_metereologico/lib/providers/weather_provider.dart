import 'package:flutter/material.dart';

import '../models/forecast_model.dart';
import '../services/brasil_api_service.dart';
import '../services/supabase_service.dart';

class WeatherProvider extends ChangeNotifier {

  final BrasilApiService _api =
      BrasilApiService();

  final SupabaseService _database =
      SupabaseService();

  bool loading = false;

  String selectedCity = '';

  double latitude = 0;

  double longitude = 0;

  List<ForecastModel> forecasts = [];

  Future<void> searchCity(
      String city) async {

    try {

      loading = true;
      notifyListeners();

      final cities =
          await _api.searchCity(city);

      if (cities.isEmpty) {
        throw Exception(
          'Cidade não encontrada',
        );
      }

      final cityData = cities.first;

      final forecastResponse =
          await _api.getForecast(
            cityData['id'],
          );

      forecasts.clear();

      for (var item
          in forecastResponse['clima']) {

        forecasts.add(
          ForecastModel.fromJson(item),
        );
      }

      selectedCity =
          cityData['nome'];

      await _database.saveWeather({
        "city": selectedCity,
        "temperature":
            forecasts.first.maxTemp,
        "humidity": 0,
        "precipitation": 0,
        "weather_condition":
            forecasts.first.condition,
      });

    } catch (e) {

      debugPrint(
        'Erro: $e',
      );

    } finally {

      loading = false;
      notifyListeners();
    }
  }
}