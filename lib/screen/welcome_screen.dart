import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'signin_screen.dart';
import 'profile_setup_screen.dart'; // Import halaman Lengkapi Profil

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -1.2),
            radius: 1.2,
            colors: [
              const Color(0xFFE0F2F1).withOpacity(0.3),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildTopNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        _buildBadge(),
                        const SizedBox(height: 20),
                        _buildTitle(),
                        const SizedBox(height: 16),
                        _buildSubtitle(),
                        const SizedBox(height: 35),
                        
                        _buildLabel("NAMA LENGKAP"),
                        const SizedBox(height: 8),
                        _buildNameField(),
                        
                        const SizedBox(height: 20),
                        _buildLabel("ALAMAT EMAIL"),
                        const SizedBox(height: 8),
                        _buildEmailField(),
                        
                        const SizedBox(height: 20),
                        _buildLabel("KATA SANDI"),
                        const SizedBox(height: 8),
                        _buildPasswordField(),
                        
                        const SizedBox(height: 12),
                        _buildAgreementSection(),
                        
                        const SizedBox(height: 30),
                        
                        // --- FOKUS PERUBAHAN DI SINI ---
                        _buildSignUpButton(),
                        
                        const SizedBox(height: 30),
                        _buildDivider(),
                        const SizedBox(height: 30),
                        _buildGoogleButton(),
                        const SizedBox(height: 32),
                        _buildFooter(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. Header Navigasi
  Widget _buildTopNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: CreaTaskColors.textMain),
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children: [
              _buildDot(true),
              _buildDot(false),
              _buildDot(false),
            ],
          ),
        ],
      ),
    );
  }

  // 2. Badge Status
  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        "DAFTAR AKUN",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: CreaTaskColors.deepOcean,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // 3. Judul
  Widget _buildTitle() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          height: 1.1,
        ),
        children: [
          TextSpan(text: "Halo!\n", style: TextStyle(color: CreaTaskColors.textMain)),
          TextSpan(text: "Mari Mulai Langkahmu.", style: TextStyle(color: CreaTaskColors.deepOcean)),
        ],
      ),
    );
  }

  // 4. Subtitle
  Widget _buildSubtitle() {
    return const Text(
      "Gabung CreaTask untuk mencari kerja harian atau memposting kebutuhan UMKM Anda.",
      style: TextStyle(
        fontSize: 14,
        color: CreaTaskColors.textSecondary,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
    );
  }

  // 5. Form Input Nama
  Widget _buildNameField() {
    return TextFormField(
      validator: (v) => v == null || v.isEmpty ? "Nama wajib diisi" : null,
      decoration: const InputDecoration(
        hintText: "Contoh: Budi Santoso",
        prefixIcon: Icon(Icons.person_outline, size: 20),
      ),
    );
  }

  // 6. Form Input Email
  Widget _buildEmailField() {
    return TextFormField(
      validator: (v) => v == null || v.isEmpty ? "Email wajib diisi" : null,
      decoration: const InputDecoration(
        hintText: "nama@email.com",
        prefixIcon: Icon(Icons.email_outlined, size: 20),
      ),
    );
  }

  // 7. Form Input Password
  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      validator: (v) => v == null || v.length < 8 ? "Minimal 8 karakter" : null,
      decoration: InputDecoration(
        hintText: "Minimal 8 karakter",
        prefixIcon: const Icon(Icons.lock_outline, size: 20),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            size: 20,
            color: Colors.grey,
          ),
          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
      ),
    );
  }

  // 8. Bagian Persetujuan
  Widget _buildAgreementSection() {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _isAgreed,
            activeColor: CreaTaskColors.deepOcean,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onChanged: (v) => setState(() => _isAgreed = v ?? false),
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            "Saya setuju dengan syarat dan ketentuan CreaTask.",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  // 9. Tombol Daftar Utama
  Widget _buildSignUpButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (!_isAgreed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Harap setujui syarat dan ketentuan")),
              );
              return;
            }
            
            // --- NAVIGASI KE SETUP PROFIL ---
            // Pastikan ini mengarah ke ProfileSetupScreen()
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const ProfileSetupScreen()),
              (route) => false,
            );
          }
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
            Text("Buat Akun", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
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
      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: CreaTaskColors.textMain, letterSpacing: 0.5),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? CreaTaskColors.deepOcean : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("ATAU", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w800)),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }

  Widget _buildGoogleButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          mouseCursor: SystemMouseCursors.click,
          borderRadius: BorderRadius.circular(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_\"G\"_Logo.svg/1200px-Google_\"G\"_Logo.svg.png', width: 20, height: 20),
              const SizedBox(width: 12),
              const Text("Daftar dengan Google", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sudah punya akun? ", style: TextStyle(color: Colors.grey, fontSize: 14)),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignInScreen())),
            child: const MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "Masuk Disini",
                style: TextStyle(color: CreaTaskColors.deepOcean, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}