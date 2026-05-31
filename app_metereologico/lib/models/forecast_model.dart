class ForecastModel {
  final String date;

  final double minTemp;

  final double maxTemp;

  final String condition;

  final String conditionCode;

  final int uvIndex;

  ForecastModel({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.conditionCode,
    required this.uvIndex,
  });

  factory ForecastModel.fromJson(
      Map<String, dynamic> json) {
    return ForecastModel(
      date: json['data'] ?? '',

      minTemp: double.parse(
        json['min'].toString(),
      ),

      maxTemp: double.parse(
        json['max'].toString(),
      ),

      condition:
          json['condicao_desc'] ?? '',

      conditionCode:
          json['condicao'] ?? '',

      uvIndex:
          json['indice_uv'] ?? 0,
    );
  }
}