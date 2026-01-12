import 'package:flutter/material.dart';

class BahasaScreen extends StatefulWidget {
  const BahasaScreen({super.key});

  @override
  State<BahasaScreen> createState() => _BahasaScreenState();
}

class _BahasaScreenState extends State<BahasaScreen> {
  // Simulasi data bahasa yang sedang aktif saat ini
  String selectedLanguage = 'Bahasa Indonesia';

  // Daftar bahasa yang tersedia
  final List<String> languages = [
    'Bahasa Indonesia',
    'English',
    '日本語 (Japanese)',
    'Deutsch (German)',
    'Français (French)',
    'Bahasa Melayu',
    'Español (Spanish)',
    'Italiano (Italian)',
  ];

  void _confirmChangeLanguage(String newLanguage) {
    // 1. Tampilkan Pop-out Konfirmasi
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: Text('Apakah Anda yakin ingin mengubah bahasa ke $newLanguage?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Tutup dialog jika batal
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tutup dialog konfirmasi
                Navigator.pop(context);
                _applyLanguageChange(newLanguage);
              },
              child: const Text('Setuju'),
            ),
          ],
        );
      },
    );
  }

  void _applyLanguageChange(String newLanguage) {
    setState(() {
      selectedLanguage = newLanguage;
    });

    // 2. Kembali ke halaman sebelumnya
    Navigator.pop(context);

    // 3. Tampilkan Pop-out sukses di halaman sebelumnya
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Bahasa telah diubah ke $newLanguage'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Bahasa'),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final lang = languages[index];
          return RadioListTile<String>(
            title: Text(lang),
            value: lang,
            groupValue: selectedLanguage,
            subtitle: lang == selectedLanguage 
                ? const Text('Bahasa yang digunakan saat ini', style: TextStyle(color: Colors.blue, fontSize: 12)) 
                : null,
            onChanged: (String? value) {
              if (value != null && value != selectedLanguage) {
                _confirmChangeLanguage(value);
              }
            },
          );
        },
      ),
    );
  }
}