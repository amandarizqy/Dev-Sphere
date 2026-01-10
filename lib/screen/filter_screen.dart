import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isMapSelected = false;
  String _selectedType = "Harian";
  String _selectedSkill = "Kurir";
  RangeValues _salaryRange = const RangeValues(1000000, 5000000);
  double _radius = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: CreaTaskColors.textMain),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Filter Pekerjaan",
          style: TextStyle(
            color: CreaTaskColors.textMain,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        actions: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedType = "Harian";
                  _selectedSkill = "Kurir";
                  _salaryRange = const RangeValues(1000000, 5000000);
                  _isMapSelected = false;
                  _radius = 5.0;
                });
              },
              child: const Text(
                "Reset",
                style: TextStyle(
                  color: CreaTaskColors.errorRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: _buildBottomButton(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildToggleButton("Daftar", Icons.list_rounded, !_isMapSelected),
                    _buildToggleButton("Peta", Icons.map_outlined, _isMapSelected),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            _buildSectionHeader("LOKASI"),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: "Jakarta Selatan, Tebet...",
                prefixIcon: const Icon(Icons.location_on_outlined, size: 20),
                fillColor: Colors.grey.shade50,
              ),
            ),
            
            const SizedBox(height: 32),

            _buildSectionHeader("KATEGORI KEAHLIAN"),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSkillChip("Kurir"),
                  _buildSkillChip("Asisten"),
                  _buildSkillChip("Koki"),
                  _buildSkillChip("Admin"),
                  _buildSkillChip("Supir"),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            _buildSectionHeader("TIPE PEKERJAAN"),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1, 
              children: [
                _buildFilterChip("Harian"),
                _buildFilterChip("Paruh Waktu"),
                _buildFilterChip("Borongan"),
                _buildFilterChip("Tetap"),
              ],
            ),
            
            const SizedBox(height: 32),
            
            _buildSectionHeader("RENTANG GAJI"),
            const SizedBox(height: 16),
            RangeSlider(
              values: _salaryRange,
              min: 0,
              max: 10000000,
              divisions: 20,
              activeColor: CreaTaskColors.deepOcean,
              inactiveColor: CreaTaskColors.seaMist,
              labels: RangeLabels(
                "Rp ${_salaryRange.start.round()}",
                "Rp ${_salaryRange.end.round()}",
              ),
              onChanged: (values) {
                setState(() => _salaryRange = values);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Rp 0", style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text("Rp 10jt+", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            
            const SizedBox(height: 32),
            
            _buildSectionHeader("RADIUS JARAK"),
            const SizedBox(height: 16),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: CreaTaskColors.deepOcean,
                inactiveTrackColor: CreaTaskColors.seaMist,
                thumbColor: CreaTaskColors.deepOcean,
                overlayColor: CreaTaskColors.deepOcean.withOpacity(0.1),
                valueIndicatorColor: CreaTaskColors.deepOcean,
              ),
              child: Slider(
                value: _radius,
                min: 1,
                max: 20,
                divisions: 19,
                label: "${_radius.round()} km",
                onChanged: (v) {
                  setState(() => _radius = v);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1 km", style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text("20 km", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w900,
        color: CreaTaskColors.textMain,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildToggleButton(String label, IconData icon, bool isActive) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isMapSelected = label == "Peta";
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            boxShadow: isActive ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 4),
              )
            ] : [],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: isActive ? CreaTaskColors.deepOcean : Colors.grey.shade500,
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: isActive ? CreaTaskColors.deepOcean : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    bool isSelected = _selectedSkill == label;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: InkWell(
          onTap: () => setState(() => _selectedSkill = label),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? CreaTaskColors.deepOcean : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.grey.shade200,
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : CreaTaskColors.textSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedType == label;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => setState(() => _selectedType = label),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? CreaTaskColors.deepOcean : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey.shade200,
              width: 1.5,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : CreaTaskColors.textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, -4),
          )
        ],
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: CreaTaskColors.deepOcean,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            elevation: 0,
          ),
          child: const Text(
            "Terapkan Hasil",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ),
      ),
    );
  }
}