import 'package:flutter/material.dart';

class BahasaScreen extends StatelessWidget {
  const BahasaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bahasa'),
      ),
      body: const Center(
        child: Text('Halaman Bahasa'),
      ),
    );
  }
}
