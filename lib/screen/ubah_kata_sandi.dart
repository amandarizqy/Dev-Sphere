import 'package:flutter/material.dart';

class UbahKataSandiScreen extends StatefulWidget {
  const UbahKataSandiScreen({super.key});

  @override
  State<UbahKataSandiScreen> createState() => _UbahKataSandiScreenState();
}

class _UbahKataSandiScreenState extends State<UbahKataSandiScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controller untuk mengambil data dari input
  final TextEditingController _passLamaController = TextEditingController();
  final TextEditingController _passBaruController = TextEditingController();
  final TextEditingController _konfirmasiPassController = TextEditingController();

  // State untuk sembunyi/tampilkan password
  bool _obscurePassLama = true;
  bool _obscurePassBaru = true;
  bool _obscureKonfirmasi = true;

  void _submitPerubahan() {
    if (_formKey.currentState!.validate()) {
      // Jika validasi berhasil, tampilkan dialog sukses
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Icon(Icons.check_circle, color: Colors.green, size: 50),
          content: const Text(
            'Kata sandi Anda berhasil diperbarui!',
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup Dialog
                  Navigator.pop(context); // Kembali ke Keamanan Akun
                },
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Kata Sandi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buat kata sandi yang kuat untuk melindungi akun Anda.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // INPUT KATA SANDI LAMA
              TextFormField(
                controller: _passLamaController,
                obscureText: _obscurePassLama,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi Lama',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassLama ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassLama = !_obscurePassLama),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Masukkan kata sandi lama';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // INPUT KATA SANDI BARU
              TextFormField(
                controller: _passBaruController,
                obscureText: _obscurePassBaru,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi Baru',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassBaru ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassBaru = !_obscurePassBaru),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 8) return 'Minimal 8 karakter';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // KONFIRMASI KATA SANDI BARU
              TextFormField(
                controller: _konfirmasiPassController,
                obscureText: _obscureKonfirmasi,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Kata Sandi Baru',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureKonfirmasi ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscureKonfirmasi = !_obscureKonfirmasi),
                  ),
                ),
                validator: (value) {
                  if (value != _passBaruController.text) return 'Kata sandi tidak cocok';
                  return null;
                },
              ),
              const SizedBox(height: 40),

              // TOMBOL SIMPAN
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: _submitPerubahan,
                  child: const Text('Simpan Perubahan', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}