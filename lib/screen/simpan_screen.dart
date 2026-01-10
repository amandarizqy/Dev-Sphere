import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'job_detail_screen.dart';

class SimpanScreen extends StatefulWidget {
  const SimpanScreen({super.key});

  @override
  State<SimpanScreen> createState() => _SimpanScreenState();
}

class _SimpanScreenState extends State<SimpanScreen> {
  String _activeCategory = "Semua";

  // Data dummy dengan tambahan field deadline sesuai permintaan
  final List<Map<String, dynamic>> _savedJobs = [
    {
      "id": "1",
      "title": "Barista Part-Time",
      "company": "Kopi Kenangan Senja",
      "location": "Tebet, Jaksel",
      "type": "Harian",
      "salary": "Rp 150.000",
      "salary_label": "Upah Harian",
      "posted_at": "Disimpan 2 jam lalu",
      "deadline": "Sisa 2 hari",
      "logo_url": "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400",
      "is_verified": true,
    },
    {
      "id": "2",
      "title": "Staf Packing Online",
      "company": "Toko Berkah Jaya",
      "location": "Jakarta Barat",
      "type": "Paruh Waktu",
      "salary": "Rp 2.500.000",
      "salary_label": "Gaji Bulanan",
      "posted_at": "Disimpan 1 hari lalu",
      "deadline": "Sisa 5 hari",
      "logo_url": "https://images.unsplash.com/photo-1586769852044-692d6e3703f0?w=400",
      "is_verified": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      // Menggunakan AppBar untuk judul tengah agar konsisten dengan halaman lain
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, // Menghilangkan tombol back otomatis jika ada
        title: const Text(
          "Pekerjaan Disimpan",
          style: TextStyle(
            color: CreaTaskColors.textMain,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryTabs(),
            Expanded(
              child: _savedJobs.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 24),
                      itemCount: _savedJobs.length,
                      itemBuilder: (context, index) {
                        final job = _savedJobs[index];
                        return _buildSavedJobCard(context, job);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    final categories = ["Semua", "Terbaru", "Segera Berakhir"];
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final bool isActive = _activeCategory == cat;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () => setState(() => _activeCategory = cat),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isActive ? CreaTaskColors.deepOcean : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isActive ? Colors.transparent : Colors.grey.shade200,
                    ),
                  ),
                  child: Text(
                    cat,
                    style: TextStyle(
                      color: isActive ? Colors.white : CreaTaskColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border_rounded, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text(
            "Belum ada pekerjaan disimpan",
            style: TextStyle(
              color: CreaTaskColors.driftwood,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedJobCard(BuildContext context, Map<String, dynamic> job) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(jobData: job),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: Colors.grey.shade100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                job["logo_url"] ?? "",
                                width: 52,
                                height: 52,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  width: 52,
                                  height: 52,
                                  color: CreaTaskColors.seaMist,
                                  child: const Icon(Icons.storefront, color: CreaTaskColors.deepOcean),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                job["title"] ?? "Judul Pekerjaan",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: CreaTaskColors.textMain,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(
                                    job["company"] ?? "UMKM Mitra",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: CreaTaskColors.textSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (job["is_verified"] == true) ...[
                                    const SizedBox(width: 4),
                                    const Icon(Icons.verified,
                                        color: CreaTaskColors.deepOcean, size: 14),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(Icons.bookmark, color: CreaTaskColors.deepOcean),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _buildTag(Icons.location_on_outlined, job["location"] ?? "Lokasi"),
                          const SizedBox(width: 8),
                          _buildTag(Icons.work_outline_rounded, job["type"] ?? "Tipe"),
                        ],
                      ),
                      // Indikator Deadline sesuai permintaan
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          job["deadline"] ?? "",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Colors.red.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 1, color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (job["salary_label"] ?? "Upah").toString().toUpperCase(),
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey.shade400,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            job["salary"] ?? "Rp -",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: CreaTaskColors.deepOcean,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        job["posted_at"] ?? "",
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F8FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: CreaTaskColors.deepOcean),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: CreaTaskColors.deepOcean,
            ),
          ),
        ],
      ),
    );
  }
}