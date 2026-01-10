import 'package:flutter/material.dart';
import 'core/app_colors.dart';
import 'screen/welcome_screen.dart';

void main() {
  runApp(const CreaTaskApp());
}

class CreaTaskApp extends StatelessWidget {
  const CreaTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CreaTask',
      theme: CreaTaskTheme.lightTheme,
      home: const WelcomeScreen(), // Alur dimulai dari Welcome
    );
  }
}