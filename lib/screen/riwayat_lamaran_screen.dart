import 'package:flutter/material.dart';

class RiwayatLamaranScreen extends StatelessWidget {
  const RiwayatLamaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background sedikit abu agar card terlihat
      appBar: AppBar(
        title: const Text('Riwayat Lamaran'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildJobCard(
            title: "Barista Part-Time",
            company: "Kopi Kenangan Senja",
            location: "Tebet, Jaksel",
            type: "Harian",
            salaryLabel: "UPAH HARIAN",
            salary: "Rp 150.000",
            logoPath: "assets/kopi_logo.png", // Ganti dengan asset Anda
            isVerified: true,
          ),
          const SizedBox(height: 16),
          _buildJobCard(
            title: "Staf Packing Online",
            company: "Toko Berkah Jaya",
            location: "Jakarta Barat",
            type: "Paruh Waktu",
            salaryLabel: "GAJI BULANAN",
            salary: "Rp 2.500.000",
            logoPath: "assets/toko_logo.png", // Ganti dengan asset Anda
            isVerified: true,
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard({
    required String title,
    required String company,
    required String location,
    required String type,
    required String salaryLabel,
    required String salary,
    required String logoPath,
    bool isVerified = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Logo dan Judul
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[200],
                  child: const Icon(Icons.business, size: 30, color: Colors.grey), 
                  // Ganti Icon di atas dengan Image.asset(logoPath) jika sudah ada gambarnya
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          company,
                          style: TextStyle(color: Colors.grey[600], fontSize: 15),
                        ),
                        if (isVerified) ...[
                          const SizedBox(width: 4),
                          const Icon(Icons.check_circle, color: Colors.blueGrey, size: 16),
                        ]
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Row Chips: Lokasi dan Tipe Kerja
          Row(
            children: [
              _buildChip(Icons.location_on_outlined, location),
              const SizedBox(width: 10),
              _buildChip(Icons.work_outline, type),
            ],
          ),
          const SizedBox(height: 24),
          
          // Footer: Label Gaji dan Nominal
          Text(
            salaryLabel,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            salary,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A6872), // Warna gelap kebiruan sesuai gambar
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F6F8), // Warna biru muda sangat soft
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF4A6872)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF4A6872),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}