import 'supabase_service.dart';

class HistoryService {

  final _database =
      SupabaseService();

  Future<List<Map<String, dynamic>>>
      getHistory() async {

    return await _database.getHistory();
  }
}