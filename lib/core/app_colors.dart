import 'package:flutter/material.dart';

class CreaTaskColors {
  static const Color deepOcean = Color(0xFF496A74);
  static const Color driftwood = Color(0xFF89A6A8);
  static const Color saltedSky = Color(0xFFBEDADC);
  static const Color seaMist = Color(0xFFD8E3E7);
  static const Color white = Color(0xFFFFFFFF);
  
  static const Color textMain = Color(0xFF131515);      
  static const Color textSecondary = Color(0xFF6F787B);
  static const Color urgentOrange = Color(0xFFE67E22);
  static const Color errorRed = Color(0xFFE74C3C);
  static const Color successGreen = Color(0xFF27AE60); 
  
  static const Color surfaceLight = Color(0xFFF2F3F3);
}

class CreaTaskTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: CreaTaskColors.deepOcean,
      scaffoldBackgroundColor: CreaTaskColors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: CreaTaskColors.deepOcean,
        primary: CreaTaskColors.deepOcean,
        secondary: CreaTaskColors.driftwood,
        surface: CreaTaskColors.white,
        error: CreaTaskColors.errorRed,
      ),
      fontFamily: 'Manrope',
      appBarTheme: const AppBarTheme(
        backgroundColor: CreaTaskColors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: CreaTaskColors.deepOcean, size: 22),
        titleTextStyle: TextStyle(
          color: CreaTaskColors.deepOcean,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          fontFamily: 'Manrope',
        ),
      ),
    );
  }
}