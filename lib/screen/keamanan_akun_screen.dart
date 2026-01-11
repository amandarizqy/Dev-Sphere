import 'package:flutter/material.dart';

class KeamananAkunScreen extends StatelessWidget {
  const KeamananAkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keamanan Akun'),
      ),
      body: const Center(
        child: Text('Halaman Keamanan Akun'),
      ),
    );
  }
}
