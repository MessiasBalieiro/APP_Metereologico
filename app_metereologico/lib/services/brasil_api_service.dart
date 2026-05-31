import 'dart:convert';

import 'package:http/http.dart' as http;

class BrasilApiService {

  Future<List<dynamic>> searchCity(
      String city) async {

    final response = await http.get(
      Uri.parse(
        'https://brasilapi.com.br/api/cptec/v1/cidade/$city',
      ),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Erro ao buscar cidade',
      );
    }

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>>
      getForecast(
          int cityCode) async {

    final response = await http.get(
      Uri.parse(
        'https://brasilapi.com.br/api/cptec/v1/clima/previsao/$cityCode/6',
      ),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Erro ao obter previsão',
      );
    }

    return jsonDecode(response.body);
  }
}