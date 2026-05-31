class WeatherModel {
  final String city;
  final double latitude;
  final double longitude;
  final double temperature;
  final double humidity;
  final double precipitation;
  final String condition;
  final DateTime date;

  WeatherModel({
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.temperature,
    required this.humidity,
    required this.precipitation,
    required this.condition,
    required this.date,
  });

  factory WeatherModel.fromJson(
      Map<String, dynamic> json) {

    return WeatherModel(
      city: json['city'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      temperature:
          double.parse(json['temperature'].toString()),
      humidity:
          double.parse(json['humidity'].toString()),
      precipitation:
          double.parse(json['precipitation'].toString()),
      condition: json['condition'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'temperature': temperature,
      'humidity': humidity,
      'precipitation': precipitation,
      'condition': condition,
      'date': date.toIso8601String(),
    };
  }
}