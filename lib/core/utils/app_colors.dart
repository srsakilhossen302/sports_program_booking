import 'package:flutter/material.dart';

class AppColors {
  // Figma colors
  static const Color backgroundDark = Color(0xFF0A1020);
  static const Color backgroundLight = Color(0xFF0F1E3A);
  static const Color primaryColor = Color(0xFF3D5CFF); // Keeping this for other uses
  static const Color white = Color(0xFFFFFFFF);
  
  static const Gradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      backgroundDark,
      backgroundLight,
      backgroundDark,
    ],
  );
}
