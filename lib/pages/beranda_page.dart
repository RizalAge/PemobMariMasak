import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Resep Masakan"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 0, 114), Color(0xFF1A1A27)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            MediaQuery.of(context).padding.top + kToolbarHeight + 16,
            16,
            16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ================== TITLE ====================
                const Text(
                  "Rekomendasi Masakan Hari Ini",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                // ================== CARD REKOMENDASI =================
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _rekomendasiCard(
                        context,
                        "Makanan",
                        "assets/images/baso.jpeg",
                      ),
                      _rekomendasiCard(
                        context,
                        "Minuman",
                        "assets/images/cendol.jpeg",
                      ),
                      _rekomendasiCard(
                        context,
                        "Pedas",
                        "assets/images/geprek.jpeg",
                      ),
                      _rekomendasiCard(
                        context,
                        "Manis",
                        "assets/images/pukis.jpeg",
                      ),
                      _rekomendasiCard(
                        context,
                        "Dingin",
                        "assets/images/salad.jpeg",
                      ),
                      _rekomendasiCard(
                        context,
                        "Panas",
                        "assets/images/ikan.jpeg",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ================== KATEGORI =================
                const Text(
                  "Kategori Makanan",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _kategoriChip("Makanan", Icons.restaurant, context),
                    _kategoriChip("Minuman", Icons.local_drink, context),
                    _kategoriChip("Pedas", Icons.local_fire_department, context),
                    _kategoriChip("Manis", Icons.cake, context),
                    _kategoriChip("Panas", Icons.local_cafe, context),
                    _kategoriChip("Dingin", Icons.ac_unit, context),
                  ],
                ),

                const SizedBox(height: 40),

                // ================== TANYA AI =================
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bingung pilih masakan?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Gunakan AI untuk dapat rekomendasi masakan sesuai selera kamu!",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/ai'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 114),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 25,
                          ),
                        ),
                        child: const Text(
                          "Tanya AI Sekarang",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==================  REKOMENDASI ==================
  Widget _rekomendasiCard(BuildContext context, String title, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/rekomendasi',
            arguments: {"kategori": title});
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Text(
            "$title",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // ================== KATEGORI  ==================
  Widget _kategoriChip(String label, IconData icon, BuildContext context) {
    return ActionChip(
      backgroundColor: const Color.fromARGB(255, 0, 0, 114),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      avatar: Icon(icon, color: Colors.white, size: 20),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/rekomendasi',
          arguments: {"kategori": label},
        );
      },
    );
  }
}
