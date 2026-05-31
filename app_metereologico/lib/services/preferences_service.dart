import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {

  static const String favoritesKey =
      'favorite_cities';

  Future<List<String>> getFavorites() async {

    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getStringList(
          favoritesKey,
        ) ??
        [];
  }

  Future<void> saveFavorites(
      List<String> cities) async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setStringList(
      favoritesKey,
      cities,
    );
  }
}