import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Edit Profil",
          style: TextStyle(
            color: CreaTaskColors.textMain,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: CreaTaskColors.textMain, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Bagian Foto Profil dengan Ikon Avatar
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: CreaTaskColors.seaMist,
                      shape: BoxShape.circle,
                      border: Border.all(color: CreaTaskColors.seaMist, width: 3),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: CreaTaskColors.deepOcean,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // Aksi untuk ganti foto
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: CreaTaskColors.deepOcean,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Form Input sesuai dengan data profil
            _buildInputField("NAMA LENGKAP", "Nanang Ismail"),
            const SizedBox(height: 24),
            _buildInputField("NOMOR WHATSAPP", "08123456789"),
            const SizedBox(height: 24),
            _buildInputField("ALAMAT EMAIL", "nanang@creatask.id"),
            const SizedBox(height: 24),
            _buildInputField("LOKASI DOMISILI", "Jakarta Selatan, Tebet"),
            const SizedBox(height: 24),
            
            // Kolom Keahlian Utama
            _buildInputField("KATEGORI KEAHLIAN", "Contoh: Kurir, Barista, Admin"),
            const SizedBox(height: 24),

            // Kolom Tentang Saya (Multi-line)
            _buildInputField(
              "TENTANG SAYA", 
              "Ceritakan singkat tentang pengalaman kerja atau keahlian Anda...",
              maxLines: 4,
            ),
            
            const SizedBox(height: 40),
            
            _buildSaveButton(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Helper untuk membangun label dan input field
  Widget _buildInputField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w900,
            color: CreaTaskColors.textMain,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            fillColor: const Color(0xFFF8FAFC),
          ),
        ),
      ],
    );
  }

  // Tombol Simpan Modern
  Widget _buildSaveButton(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Profil berhasil diperbarui"),
              backgroundColor: CreaTaskColors.successGreen,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CreaTaskColors.deepOcean,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 0,
        ),
        child: const Text(
          "Simpan Perubahan",
          style: TextStyle(
            fontWeight: FontWeight.w900, 
            fontSize: 16, 
            color: Colors.white
          ),
        ),
      ),
    );
  }
}