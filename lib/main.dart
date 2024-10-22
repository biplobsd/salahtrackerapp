import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Salah Tracker App',
      routerConfig: goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.green,
        ),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Black background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 16.0, horizontal: 24.0), // Padding for the button
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 16.0), // Text style (optional)
          ),
        ),
      ),
    );
  }
}
