import 'dart:math';
import 'package:flutter/material.dart';

extension ColorUtils on Color {
  static Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}