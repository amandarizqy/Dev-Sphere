import 'package:flutter/material.dart';

class UlasanFeedbackScreen extends StatelessWidget {
  const UlasanFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan & Feedback'),
      ),
      body: const Center(
        child: Text('Halaman Ulasan & Feedback'),
      ),
    );
  }
}
