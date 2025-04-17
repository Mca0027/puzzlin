import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F3FF),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo con tamaño aumentado y sombra sutil
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 12,
                      spreadRadius: 4,
                    )
                  ],
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 250, // Tamaño aumentado significativamente
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              // Título con mejor jerarquía visual
              const Text(
                '¡Bienvenido a Puzzlín!',
                style: TextStyle(
                  fontSize: 32, // Tamaño aumentado
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // Subtítulo opcional
              const Text(
                'Divertidos puzzles para aprender jugando',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Botón mejorado con InkWell para efecto táctil
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/level-selection');
                },
                borderRadius: BorderRadius.circular(30), // Mantén el mismo radio de borde
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                    child: const Text(
                      '¡Jugar!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  '¿Eres nuevo? Regístrate aquí',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}