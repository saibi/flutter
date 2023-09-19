import 'package:flutter/material.dart';
import 'package:splash/screens/character_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const CharacterScreen(),
    );
  }
}
