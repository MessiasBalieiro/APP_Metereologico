import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {

  final supabase =
      Supabase.instance.client;

  Future<void> saveWeather(
      Map<String, dynamic> data) async {

    await supabase
        .from('weather_history')
        .insert(data);
  }

  Future<List<Map<String, dynamic>>>
      getHistory() async {

    final response =
        await supabase
            .from('weather_history')
            .select()
            .order(
              'created_at',
              ascending: false,
            );

    return List<Map<String, dynamic>>
        .from(response);
  }
}