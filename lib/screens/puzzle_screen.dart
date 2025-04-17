import 'package:flutter/material.dart';
import 'dart:math'; // Para desordenar las piezas

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  String puzzleType = 'Desconocido';
  String? selectedAnimal; // Permitir null para otros tipos de puzzle
  List<String> puzzlePieces = [];
  List<Offset> piecePositions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      if (arguments.containsKey('puzzleType')) {
        puzzleType = arguments['puzzleType'] as String;
      }
      if (arguments.containsKey('animal')) {
        selectedAnimal = arguments['animal'] as String?;
      }
      _loadPuzzle();
    }
  }

  void _loadPuzzle() {
    puzzlePieces.clear();
    piecePositions.clear();
    if (puzzleType == 'animals' && selectedAnimal != null && selectedAnimal!.isNotEmpty) {
      _loadAnimalPuzzle(selectedAnimal!);
    } else if (puzzleType == 'shapes') {
      _loadGenericPuzzle('formas'); // Placeholder para puzzle de formas
    } else if (puzzleType == 'colors') {
      _loadGenericPuzzle('colores'); // Placeholder para puzzle de colores
    } else if (puzzleType == 'numbers') {
      _loadGenericPuzzle('numeros'); // Placeholder para puzzle de números
    }
    // Generar posiciones iniciales aleatorias para las piezas (si hay piezas)
    final random = Random();
    piecePositions = List.generate(puzzlePieces.length, (i) => Offset(
      50.0 + random.nextDouble() * 200,
      100.0 + random.nextDouble() * 200,
    ));
  }

  void _loadAnimalPuzzle(String animal) {
    for (int i = 1; i <= 4; i++) { // Asumiendo 4 piezas por ahora
      puzzlePieces.add('assets/images/puzzles/animales/${animal}_pieza_$i.jpg');
    }
  }

  void _loadGenericPuzzle(String puzzleName) {
    // Aquí podríamos cargar las rutas de las piezas para otros tipos de puzzle
    // Por ahora, solo agregamos algunos placeholders
    for (int i = 1; i <= 3; i++) {
      puzzlePieces.add('assets/images/puzzles/${puzzleName}/${puzzleName}_pieza_$i.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String fullImagePath = 'assets/images/puzzles/animales/animal_completo_${selectedAnimal}.jpg';
    print('Intentando cargar la imagen completa en la ruta: $fullImagePath'); // *** NUEVO PRINT ***

    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle de $puzzleType'),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: Stack(
        children: [
          // Imagen completa (solo para animales por ahora)
          if (puzzleType == 'animals' && selectedAnimal != null && selectedAnimal!.isNotEmpty)
            Positioned(
              left: 50,
              top: 50,
              child: Image.asset(
                fullImagePath, // Usamos la variable con la ruta
                height: 200,
                key: UniqueKey(), // *** NUEVO KEY ***
                errorBuilder: (context, error, stackTrace) {
                  print('Error AL CARGAR la imagen completa: $error para ${selectedAnimal}');
                  return const Text('Error al cargar la imagen');
                },
              ),
            ),
          // Piezas del puzzle (arrastrables)
          ...puzzlePieces.asMap().entries.map((entry) {
            int index = entry.key;
            String piecePath = entry.value;
            return Positioned(
              left: piecePositions[index].dx,
              top: piecePositions[index].dy,
              child: Draggable(
                data: piecePath,
                feedback: Image.asset(
                  piecePath,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox.shrink(); // O un placeholder
                  },
                ),
                childWhenDragging: const SizedBox(width: 80, height: 80),
                child: Image.asset(
                  piecePath,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox.shrink(); // O un placeholder
                  },
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}