import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'edit_profile_screen.dart';
import 'signin_screen.dart'; // Import halaman Sign In
import 'riwayat_lamaran_screen.dart';
import 'ulasan_feedback_screen.dart';
import 'keamanan_akun_screen.dart';
import 'bahasa_screen.dart';
import 'pusat_bantuan_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Background Header Dua Warna
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CreaTaskColors.deepOcean,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                ),
                // Avatar (Overlap)
                Positioned(
                  top: 120,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: CreaTaskColors.seaMist,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: CreaTaskColors.deepOcean,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: const Text(
                    "Profil Saya",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            
            // Nama dan Email
            const Text(
              "Nanang Ismail",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: CreaTaskColors.textMain,
              ),
            ),
            const Text(
              "nanang@creatask.id",
              style: TextStyle(
                color: CreaTaskColors.textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            
            const SizedBox(height: 24),

            // Statistik Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem("12", "Selesai"),
                  _buildVerticalDivider(),
                  _buildStatItem("4.9", "Rating"),
                  _buildVerticalDivider(),
                  _buildStatItem("2 Tahun", "Pengalaman"),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Tombol Edit Profil
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: CreaTaskColors.deepOcean,
                    minimumSize: const Size(double.infinity, 54),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: const Text("Edit Profil", style: TextStyle(fontWeight: FontWeight.w800)),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Bagian Tentang Saya
            _buildSectionHeader("TENTANG SAYA"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                "Saya adalah seorang pekerja keras yang memiliki pengalaman di bidang logistik dan hospitality. Berkomitmen untuk memberikan pelayanan terbaik dan disiplin waktu.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Bagian Keahlian
            _buildSectionHeader("KEAHLIAN UTAMA"),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildSkillTag("Kurir"),
                  _buildSkillTag("Barista"),
                  _buildSkillTag("Packing"),
                  _buildSkillTag("Admin"),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Bagian Sertifikat
            _buildSectionHeader("SERTIFIKAT & PENGHARGAAN"),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildCertificateCard("Sertifikat Vaksinasi", "Kemenkes RI"),
                  _buildCertificateCard("Basic Hospitality", "LSP Hotel"),
                  _buildCertificateCard("Pelatihan Kurir", "Mitra Logistik"),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Bagian Ulasan
            _buildSectionHeader("ULASAN TERBARU"),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildReviewItem(
                    "Kopi Kenangan Senja",
                    "Kerjanya sangat cepat dan ramah kepada pelanggan. Sangat direkomendasikan!",
                    5,
                  ),
                  const SizedBox(height: 12),
                  _buildReviewItem(
                    "Toko Berkah Jaya",
                    "Disiplin waktu dan teliti dalam melakukan packing barang pecah belah.",
                    5,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Menu Utama
            _buildSectionHeader("PENGATURAN & LAINNYA"),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                child: Column(
                  children: [
                    _buildDivider(),
                    _buildMenuTile(
                      icon: Icons.work_history_outlined,
                      title: "Riwayat Lamaran",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const RiwayatLamaranScreen()));
                      },
                    ),
                    _buildDivider(),
                    _buildMenuTile(
                      icon: Icons.star_outline_rounded,
                      title: "Ulasan & Feedback",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const UlasanFeedbackScreen()));
                      },
                    ),
                    _buildDivider(),
                    _buildMenuTile(
                      icon: Icons.security_outlined,
                      title: "Keamanan Akun",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const KeamananAkunScreen()));
                      },
                    ),
                    _buildDivider(),
                    _buildMenuTile(
                      icon: Icons.language_rounded,
                      title: "Bahasa",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const BahasaScreen()));
                      },
                    ),
                    _buildDivider(),
                    _buildMenuTile(
                      icon: Icons.help_outline_rounded,
                      title: "Pusat Bantuan",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const PusatBantuanScreen()));
                      },
                    ),
                    _buildDivider(),
                    _buildMenuTile(
                      icon: Icons.logout_rounded,
                      title: "Keluar",
                      isDanger: true,
                      onTap: () {
                        
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const SignInScreen()),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w900,
            color: CreaTaskColors.textMain,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: CreaTaskColors.textMain,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: CreaTaskColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 24,
      width: 1,
      color: const Color(0xFFE2E8F0),
    );
  }

  Widget _buildSkillTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F8FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CreaTaskColors.seaMist.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: CreaTaskColors.deepOcean,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildCertificateCard(String title, String issuer) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: CreaTaskColors.seaMist.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.verified_user_outlined, color: CreaTaskColors.deepOcean, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: CreaTaskColors.textMain),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  issuer,
                  style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, String comment, int rating) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CreaTaskColors.textMain),
              ),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: Colors.amber,
                    size: 16,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            comment,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDanger = false,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDanger ? const Color(0xFFFEF2F2) : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 20,
            color: isDanger ? Colors.red : CreaTaskColors.deepOcean,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: isDanger ? Colors.red : CreaTaskColors.textMain,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: isDanger ? Colors.red.withOpacity(0.5) : Colors.grey.shade400,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(height: 1, color: Color(0xFFF1F5F9)),
    );
  }
}
