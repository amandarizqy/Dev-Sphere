import 'package:flutter/material.dart';

class PusatBantuanScreen extends StatelessWidget {
  const PusatBantuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusat Bantuan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header & Search Bar
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueAccent.withOpacity(0.1),
              child: Column(
                children: [
                  const Text(
                    "Ada yang bisa kami bantu?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Cari bantuan...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 2. Kategori FAQ
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Kategori Masalah",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  _buildFaqTile("Akun & Keamanan", Icons.person_outline),
                  _buildFaqTile("Proses Lamaran Kerja", Icons.description_outlined),
                  _buildFaqTile("Pembayaran & Upah", Icons.payments_outlined),
                  _buildFaqTile("Kendala Teknis", Icons.settings_suggest_outlined),
                ],
              ),
            ),

            const Divider(),

            // 3. Kontak Langsung
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Masih butuh bantuan?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  _buildContactCard(
                    context,
                    "Chat dengan Admin",
                    "Respons cepat (09:00 - 18:00)",
                    Icons.chat_bubble_outline,
                    Colors.green,
                  ),
                  const SizedBox(height: 10),
                  _buildContactCard(
                    context,
                    "Kirim Email",
                    "Tanggapan dalam 24 jam",
                    Icons.email_outlined,
                    Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {
        // Navigasi ke detail FAQ
      },
    );
  }

  Widget _buildContactCard(BuildContext context, String title, String sub, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sub),
        onTap: () {
          // Aksi kontak
        },
      ),
    );
  }
}