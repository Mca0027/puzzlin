import 'package:flutter/material.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Elige un Puzzle!'),
        titleTextStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
        elevation: 2,
      ),
      backgroundColor: const Color(0xFFF0F8FF),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.1, // Ajusta la proporción para más espacio para el texto
          children: <Widget>[
            _buildPuzzleOption(
              context,
              'Animales',
              'assets/images/animal_puzzle_thumb.png',
              '/puzzle',
              {'puzzleType': 'animals', 'animal': 'leon'}, // ¡CAMBIO AQUÍ!
            ),
            _buildPuzzleOption(
              context,
              'Formas',
              'assets/images/shapes_puzzle_thumb.png',
              '/puzzle',
              {'puzzleType': 'shapes'},
            ),
            _buildPuzzleOption(
              context,
              'Colores',
              'assets/images/colors_puzzle_thumb.jpg',
              '/puzzle',
              {'puzzleType': 'colors'},
            ),
            _buildPuzzleOption(
              context,
              'Números',
              'assets/images/numbers_puzzle_thumb.jpg',
              '/puzzle',
              {'puzzleType': 'numbers'},
            ),
            // Añade más opciones aquí
          ],
        ),
      ),
    );
  }

  Widget _buildPuzzleOption(
      BuildContext context, String title, String imagePath, String route, Map<String, dynamic> arguments) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route, arguments: arguments);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded( // Para que la imagen no se comprima con el texto
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) { // <--- AQUÍ ESTÁ EL CAMBIO
                    return const Text('Error al cargar la imagen');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}