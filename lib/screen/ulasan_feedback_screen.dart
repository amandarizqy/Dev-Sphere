import 'package:flutter/material.dart';

class UlasanFeedbackScreen extends StatelessWidget {
  const UlasanFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan & Feedback'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Ringkasan Rating
            _buildRatingSummary(),
            
            const Divider(thickness: 1, height: 40),

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
                    "2 jam yang lalu",
                  ),
                  const SizedBox(height: 16),
                  _buildReviewItem(
                    "Toko Berkah Jaya",
                    "Disiplin waktu dan teliti dalam melakukan packing barang pecah belah.",
                    5,
                    "Kemarin",
                  ),
                  const SizedBox(height: 16),
                  _buildReviewItem(
                    "Sate Pak Kumis",
                    "Cukup baik, namun komunikasi perlu ditingkatkan sedikit lagi.",
                    4,
                    "3 hari yang lalu",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget Header Seksi
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  // Widget Item Ulasan
  Widget _buildReviewItem(String name, String comment, int rating, String date) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 18,
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            comment,
            style: const TextStyle(color: Colors.black87, height: 1.4),
          ),
        ],
      ),
    );
  }

  // Widget Tambahan: Ringkasan Rating di bagian atas
  Widget _buildRatingSummary() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "4.9",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Text("dari 5.0", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Column(
              children: [
                _buildRatingBar(5, 0.9),
                _buildRatingBar(4, 0.1),
                _buildRatingBar(3, 0.0),
                _buildRatingBar(2, 0.0),
                _buildRatingBar(1, 0.0),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRatingBar(int star, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text("$star", style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[200],
              color: Colors.amber,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}