import 'package:basics/gradient_container.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Colors.black,
            Colors.grey,
          ],
        ),
      ),
    ),
  );
}
