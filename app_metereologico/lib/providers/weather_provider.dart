import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/forecast_model.dart';
import '../services/brasil_api_service.dart';
import '../services/location_service.dart';
import '../services/location_to_city_service.dart';
import '../services/preferences_service.dart';
import '../services/supabase_service.dart';

class WeatherProvider extends ChangeNotifier {
  final BrasilApiService _api = BrasilApiService();

  final SupabaseService _database = SupabaseService();

  bool loading = false;

  bool darkMode = false;

  String selectedCity = '';

  double currentLatitude = -23.5505;

  double currentLongitude = -46.6333;

  List<ForecastModel> forecasts = [];

  List<String> favorites = [];

  Future<void> searchCity(String city) async {
    try {
      loading = true;
      notifyListeners();

      final cities = await _api.searchCity(city);

      if (cities.isEmpty) {
        throw Exception('Cidade não encontrada');
      }

      final cityData = cities.first;

      final forecastResponse =
          await _api.getForecast(cityData['id']);

      forecasts.clear();

      for (final item in forecastResponse['clima']) {
        forecasts.add(
          ForecastModel.fromJson(item),
        );
      }

      selectedCity = cityData['nome'];

      await _database.saveWeather({
        "city": selectedCity,
        "latitude": currentLatitude,
        "longitude": currentLongitude,
        "temperature":
            forecasts.isNotEmpty
                ? forecasts.first.maxTemp
                : 0,
        "humidity": 0,
        "precipitation": 0,
        "weather_condition":
            forecasts.isNotEmpty
                ? forecasts.first.condition
                : "",
      });
    } catch (e) {
      debugPrint(
        'Erro ao buscar cidade: $e',
      );
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> loadFavorites() async {
    favorites =
        await PreferencesService()
            .getFavorites();

    notifyListeners();
  }

  Future<void> addFavorite(
      String city) async {
    if (!favorites.contains(city)) {
      favorites.add(city);

      await PreferencesService()
          .saveFavorites(
        favorites,
      );

      notifyListeners();
    }
  }

  Future<void> loadTheme() async {
    final prefs =
        await SharedPreferences.getInstance();

    darkMode =
        prefs.getBool('darkMode') ?? false;

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    darkMode = !darkMode;

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool(
      'darkMode',
      darkMode,
    );

    notifyListeners();
  }

  Future<void> loadCurrentCity() async {
    try {
      final position =
          await LocationService()
              .getCurrentLocation();

      currentLatitude =
          position.latitude;

      currentLongitude =
          position.longitude;

      final city =
          await LocationToCityService()
              .getCityName(
        currentLatitude,
        currentLongitude,
      );

      if (city.isNotEmpty) {
        await searchCity(city);
      }
    } catch (e) {
      debugPrint(
        'Erro ao obter localização: $e',
      );
    }
  }
}