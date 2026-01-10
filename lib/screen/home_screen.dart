import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'job_detail_screen.dart';
import 'notification_screen.dart';
import 'filter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variabel untuk melacak kategori yang sedang dipilih (simulasi)
  String _selectedCategory = "Semua";

  // Data dummy pekerjaan disinkronkan dengan SimpanScreen
  final List<Map<String, dynamic>> _jobs = [
    {
      "id": "1",
      "title": "Staf Packing Online",
      "company": "Toko Berkah Jaya",
      "location": "Jakarta Barat",
      "type": "Paruh Waktu",
      "salary": "Rp 2.500.000",
      "salary_label": "Gaji Bulanan",
      "posted_at": "2 jam yang lalu",
      "is_verified": true,
      "is_saved": false,
      "logo_url": "https://images.unsplash.com/photo-1586769852044-692d6e3703f0?w=400",
    },
    {
      "id": "2",
      "title": "Barista Part-Time",
      "company": "Kopi Kenangan Senja",
      "location": "Tebet, Jaksel",
      "type": "Harian",
      "salary": "Rp 150.000",
      "salary_label": "Upah Harian",
      "posted_at": "4 jam yang lalu",
      "is_verified": true,
      "is_saved": true,
      "logo_url": "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildSearchSection(context),
              _buildCategories(),
              _buildRecommendationHeader(),
              _buildJobList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CreaTaskColors.deepOcean,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.work_history, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "CreaTask",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: CreaTaskColors.textMain),
                  ),
                  Text(
                    "Temukan peluang hari ini",
                    style: TextStyle(fontSize: 12, color: CreaTaskColors.textSecondary),
                  ),
                ],
              ),
            ],
          ),
          // Tombol Notifikasi
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: CreaTaskColors.textMain, size: 28),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationScreen())),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari pekerjaan harian...",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Gemini AI dengan Gradasi
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFF4285F4), Color(0xFF9B72CB), Color(0xFFD96570)],
                    ).createShader(bounds),
                    child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Filter dalam Lingkaran Presisi
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FilterScreen())),
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFD8E3E7).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.tune_rounded, color: CreaTaskColors.deepOcean, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {"label": "Semua", "icon": Icons.grid_view_rounded},
      {"label": "Terdekat", "icon": Icons.location_on_outlined},
      {"label": "Gaji Tertinggi", "icon": Icons.payments_outlined},
    ];

    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final String label = cat["label"] as String;
          final isActive = _selectedCategory == label;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => setState(() => _selectedCategory = label),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isActive ? CreaTaskColors.deepOcean : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isActive ? Colors.transparent : Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      cat["icon"] as IconData,
                      size: 18,
                      color: isActive ? Colors.white : CreaTaskColors.textSecondary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : CreaTaskColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecommendationHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Rekomendasi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: CreaTaskColors.textMain),
          ),
          Text(
            "Dipilih khusus untukmu",
            style: TextStyle(fontSize: 12, color: CreaTaskColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildJobList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: _jobs.length,
      itemBuilder: (context, index) {
        final job = _jobs[index];
        final bool isSaved = job["is_saved"] ?? false;

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
            ],
          ),
          child: InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => JobDetailScreen(jobData: job))),
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          (job["logo_url"] ?? "").toString(), 
                          width: 52, 
                          height: 52, 
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 52, height: 52, color: Colors.grey.shade200, 
                            child: const Icon(Icons.storefront, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (job["title"] ?? "").toString(), 
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  (job["company"] ?? "").toString(), 
                                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                                ),
                                const SizedBox(width: 4),
                                if (job["is_verified"] == true)
                                  const Icon(Icons.verified, color: CreaTaskColors.deepOcean, size: 14),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Ikon Bookmark fungsional
                      IconButton(
                        icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,
                          color: isSaved ? CreaTaskColors.deepOcean : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            job["is_saved"] = !isSaved;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildTag((job["location"] ?? "").toString()),
                      const SizedBox(width: 8),
                      _buildTag((job["type"] ?? "").toString()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (job["salary_label"] ?? "").toString().toUpperCase(), 
                            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          Text(
                            (job["salary"] ?? "").toString(), 
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: CreaTaskColors.deepOcean),
                          ),
                        ],
                      ),
                      Text(
                        (job["posted_at"] ?? "").toString(), 
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: const Color(0xFFF1F8FA), borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: CreaTaskColors.deepOcean)),
    );
  }
}