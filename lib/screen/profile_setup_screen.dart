import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'navigation_container.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final List<String> _selectedSkills = ["Asisten Rumah Tangga", "Memasak"];
  final List<String> _suggestions = ["Supir", "Tukang Kebun", "Penjaga Toko", "Laundry"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopNavigation(),
            _buildProgressBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      _buildTitleSection(),
                      const SizedBox(height: 35),

                      _buildLabel("Nomor WhatsApp"),
                      const SizedBox(height: 8),
                      _buildTextField(
                        hint: "812-3456-7890",
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        helper: "Pastikan nomor aktif dan terhubung dengan WhatsApp.",
                      ),

                      const SizedBox(height: 25),

                      _buildLabel("Lokasi Domisili"),
                      const SizedBox(height: 8),
                      _buildTextField(
                        hint: "Cari kelurahan atau kecamatan...",
                        icon: Icons.location_on_outlined,
                        suffixIcon: Icons.my_location,
                      ),

                      const SizedBox(height: 25),

                      _buildSkillsSection(),
                      
                      const SizedBox(height: 40),
                      _buildSubmitButton(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: CreaTaskColors.textMain),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Text(
            "LANGKAH 2 DARI 2",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: CreaTaskColors.deepOcean,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: LinearProgressIndicator(
        value: 1.0,
        backgroundColor: Color(0xFFE2E8F0),
        valueColor: AlwaysStoppedAnimation<Color>(CreaTaskColors.deepOcean),
        minHeight: 4,
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Lengkapi",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: CreaTaskColors.textMain),
        ),
        const Text(
          "Profil Anda",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: CreaTaskColors.deepOcean, height: 1.1),
        ),
        const SizedBox(height: 12),
        const Text(
          "Data ini membantu pemberi kerja menghubungi dan menemukan Anda dengan mudah.",
          style: TextStyle(
            color: CreaTaskColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    IconData? suffixIcon,
    TextInputType? keyboardType,
    String? helper,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20),
            suffixIcon: suffixIcon != null 
              ? MouseRegion(
                  cursor: SystemMouseCursors.click, 
                  child: Icon(suffixIcon, color: CreaTaskColors.deepOcean, size: 20)
                ) 
              : null,
          ),
        ),
        if (helper != null) ...[
          const SizedBox(height: 8),
          Text(helper, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLabel("Keahlian Utama"),
            const Text("Maks. 5", style: TextStyle(color: Colors.grey, fontSize: 10)),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Ketik keahlian (contoh: Supir)",
            prefixIcon: const Icon(Icons.work_outline, size: 20),
            suffixIcon: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: IconButton(
                icon: const Icon(Icons.add_circle, color: CreaTaskColors.deepOcean),
                onPressed: () {},
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _selectedSkills.map((skill) => _buildSkillChip(skill)).toList(),
        ),
        const SizedBox(height: 25),
        const Text(
          "SARAN POPULER",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 0.5),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _suggestions.map((s) => _buildSuggestionChip(s)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ElevatedButton(
        onPressed: () {

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MainNavigationHub()),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CreaTaskColors.deepOcean,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Simpan & Lanjutkan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: CreaTaskColors.textMain),
    );
  }

  Widget _buildSkillChip(String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F8FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: CreaTaskColors.seaMist.withOpacity(0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: const TextStyle(color: CreaTaskColors.deepOcean, fontSize: 13, fontWeight: FontWeight.w600)),
              const SizedBox(width: 8),
              const Icon(Icons.close, size: 14, color: CreaTaskColors.deepOcean),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionChip(String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}