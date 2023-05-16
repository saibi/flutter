import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardColor: const Color(0xFFF4EDDB),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        colorScheme: const ColorScheme.light(background: Color(0xFFE7626C)),
      ),
      home: const HomeScreen(),
    );
  }
}
