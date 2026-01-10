import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'signin_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1500),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent
                        ],
                        stops: [0.6, 1.0],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'assets/pelaku_umkm.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: CreaTaskColors.seaMist,
                          child: const Icon(Icons.image, size: 100, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: CreaTaskColors.deepOcean.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.work_history, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "CreaTask",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 4.0,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Solusi Kerja &\nBisnis Anda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: CreaTaskColors.textMain,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Hubungkan keahlian Anda dengan peluang terbaik di sekitar, atau temukan bantuan cepat untuk usaha Anda.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: CreaTaskColors.textSecondary,
                          fontWeight: FontWeight.w500,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignInScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CreaTaskColors.deepOcean,
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Masuk",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignUpScreen()),
                            );
                          },
                          child: const Text(
                            "Daftar Akun Baru",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: CreaTaskColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


