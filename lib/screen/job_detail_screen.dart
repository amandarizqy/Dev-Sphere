import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'chat_screen.dart';

class JobDetailScreen extends StatefulWidget {
  final Map<String, dynamic> jobData;

  const JobDetailScreen({super.key, required this.jobData});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _isSaved = widget.jobData["is_saved"] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: CreaTaskColors.textMain),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          "Detail Pekerjaan",
          style: TextStyle(
            color: CreaTaskColors.textMain, 
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        actions: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: IconButton(
              icon: Icon(
                _isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,
                color: _isSaved ? CreaTaskColors.deepOcean : CreaTaskColors.textMain,
              ),
              onPressed: () {
                setState(() {
                  _isSaved = !_isSaved;
                });
              },
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: _buildBottomActions(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Judul Pekerjaan
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Text(
                widget.jobData["title"] ?? "Pekerjaan",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: CreaTaskColors.textMain,
                  height: 1.2,
                ),
              ),
            ),
            
            const SizedBox(height: 24),

            // Kartu Perusahaan (Sekarang di atas Grid)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                child: Row(
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
                          widget.jobData["logo_url"] ?? "",
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 56,
                            height: 56,
                            color: CreaTaskColors.seaMist,
                            child: const Icon(Icons.storefront, color: CreaTaskColors.deepOcean),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.jobData["company"] ?? "UMKM Mitra",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: CreaTaskColors.textMain,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.verified, color: CreaTaskColors.deepOcean, size: 16),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Pemberi Kerja Terverifikasi",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade100),
                        ),
                        child: const Icon(Icons.arrow_forward_ios, size: 12, color: CreaTaskColors.deepOcean),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Grid 2x2 Highlights (Sekarang di bawah Kartu Perusahaan)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.4,
                children: [
                  _buildHighlightBox(
                    "GAJI", 
                    widget.jobData["salary"] ?? "Rp -", 
                    Icons.payments_outlined
                  ),
                  _buildHighlightBox(
                    "TIPE", 
                    widget.jobData["type"] ?? "Harian", 
                    Icons.work_outline_rounded
                  ),
                  _buildHighlightBox(
                    "LOKASI", 
                    widget.jobData["location"] ?? "Lokasi", 
                    Icons.location_on_outlined
                  ),
                  _buildHighlightBox(
                    "JARAK", 
                    "2.4 km", 
                    Icons.near_me_outlined
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Deskripsi Pekerjaan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tentang Pekerjaan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: CreaTaskColors.textMain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Kami sedang mencari tenaga kerja yang berdedikasi untuk bergabung dengan tim kami. Posisi ini membutuhkan ketelitian dan semangat kerja yang tinggi.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Persyaratan Utama",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: CreaTaskColors.textMain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildRequirementItem("Mampu bekerja secara tim maupun individu"),
                  _buildRequirementItem("Jujur, disiplin, dan bertanggung jawab"),
                  _buildRequirementItem("Berpenampilan menarik dan komunikatif"),
                  _buildRequirementItem("Diutamakan domisili ${widget.jobData["location"] ?? "terdekat"}"),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightBox(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: CreaTaskColors.deepOcean),
          const SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: Colors.grey.shade500,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: CreaTaskColors.textMain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: CreaTaskColors.deepOcean,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    companyName: widget.jobData["company"] ?? "UMKM Mitra",
                    companyLogo: widget.jobData["logo_url"] ?? "",
                  ),
                ),
              ),
              borderRadius: BorderRadius.circular(18),
              child: Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.chat_bubble_outline_rounded, color: CreaTaskColors.deepOcean, size: 24),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Lamaran Anda berhasil dikirim!"),
                      backgroundColor: CreaTaskColors.successGreen,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CreaTaskColors.deepOcean,
                  minimumSize: const Size(double.infinity, 58),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  elevation: 0,
                ),
                child: const Text(
                  "Lamar Sekarang",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}