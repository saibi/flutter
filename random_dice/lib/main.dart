import 'package:flutter/material.dart';
import 'package:random_dice/const/colors.dart';
import 'package:random_dice/screen/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          sliderTheme: SliderThemeData(
            thumbColor: primaryColor,
            activeTrackColor: primaryColor,
            inactiveTrackColor: primaryColor.withOpacity(0.3),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: primaryColor,
            unselectedItemColor: secondaryColor,
            backgroundColor: backgroundColor,
          )),
      home: const RootScreen(),
    );
  }
}
