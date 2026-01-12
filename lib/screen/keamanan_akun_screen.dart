import 'package:flutter/material.dart';
// Contoh:
import 'ubah_kata_sandi.dart';

class KeamananAkunScreen extends StatefulWidget {
  const KeamananAkunScreen({super.key});

  @override
  State<KeamananAkunScreen> createState() => _KeamananAkunScreenState();
}

class _KeamananAkunScreenState extends State<KeamananAkunScreen> {
  bool _isBiometricActive = false;
  bool _isTwoFactorActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keamanan Akun'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('Kredensial Utama'),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Ubah Kata Sandi'),
            subtitle: const Text('Terakhir diubah 3 bulan lalu'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const UbahKataSandiScreen()),
              );
            },
          ),
          const Divider(),

          _buildSectionHeader('Keamanan Tambahan'),
          SwitchListTile(
            secondary: const Icon(Icons.security_rounded),
            title: const Text('Autentikasi Dua Faktor (2FA)'),
            subtitle: const Text('Amankan akun dengan verifikasi tambahan'),
            value: _isTwoFactorActive,
            onChanged: (bool value) {
              setState(() => _isTwoFactorActive = value);
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.fingerprint),
            title: const Text('Keamanan Biometrik'),
            subtitle: const Text('Gunakan Sidik Jari atau Face ID'),
            value: _isBiometricActive,
            onChanged: (bool value) {
              setState(() => _isBiometricActive = value);
            },
          ),
          const Divider(),

          _buildSectionHeader('Akses Perangkat'),
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text('Perangkat Terhubung'),
            subtitle: const Text('Lihat di mana saja Anda sedang login'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigasi ke daftar perangkat
            },
          ),
          const Divider(),

          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Logika konfirmasi hapus akun
            },
            child: const Text(
              'Hapus Akun Permanen',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}