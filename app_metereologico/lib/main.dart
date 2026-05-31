import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/supabase_config.dart';
import 'providers/weather_provider.dart';
import 'screens/home_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
        ),
      ],
      child: const ClimaBrasil(),
    ),
  );
}

class ClimaBrasil extends StatelessWidget {

  const ClimaBrasil({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Clima Brasil',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),

      home: const HomeScreen(),
    );
  }
}