import 'dart:convert';

import 'package:http/http.dart' as http;

class CityCoordinatesService {

  Future<Map<String, double>?> getCoordinates(
      String city) async {

    try {

      final response = await http.get(
        Uri.parse(
          'https://nominatim.openstreetmap.org/search?q=$city,Brasil&format=json&limit=1',
        ),
        headers: {
          'User-Agent': 'ClimaBrasilApp'
        },
      );

      if (response.statusCode != 200) {
        return null;
      }

      final data =
          jsonDecode(response.body);

      if (data.isEmpty) {
        return null;
      }

      return {
        'lat': double.parse(
          data[0]['lat'],
        ),
        'lon': double.parse(
          data[0]['lon'],
        ),
      };

    } catch (e) {

      print(
        'Erro coordenadas: $e',
      );

      return null;
    }
  }
}