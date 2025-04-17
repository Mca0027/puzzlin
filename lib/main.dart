import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/register_screen.dart';
import 'screens/level_selection_screen.dart'; // Asegúrate de tener esta importación
import 'screens/puzzle_screen.dart'; // Y esta importación

void main() {
  runApp(const PuzzlinApp());
}

class PuzzlinApp extends StatelessWidget {
  const PuzzlinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzlín',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 252, 255, 52)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/register': (context) => const RegisterScreen(),
        '/level-selection': (context) => const LevelSelectionScreen(), // <--- VERIFICA ESTA LÍNEA
        '/puzzle': (context) => const PuzzleScreen(), // <--- Y ESTA LÍNEA
      },
    );
  }
}