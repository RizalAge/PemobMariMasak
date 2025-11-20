import 'package:flutter/material.dart';

class RekomendasiPage extends StatefulWidget {
  const RekomendasiPage({super.key});

  @override
  State<RekomendasiPage> createState() => _RekomendasiPageState();
}

class _RekomendasiPageState extends State<RekomendasiPage> {
  String selectedjenis = "All";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Ambil data kategori dari halaman sebelumnya
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    if (args != null && args['kategori'] != null) {
      selectedjenis = args['kategori'];
    }

    setState(() {});
  }

  final List<Map<String, dynamic>> items = [

    // Makanan
    {"title": "Seblak", "img": "assets/images/seblak.jpeg", "jenis": "Makanan"},
    {"title": "Risol", "img": "assets/images/risol.jpeg", "jenis": "Makanan"},
    {"title": "Rujak", "img": "assets/images/rujak.jpeg", "jenis": "Makanan"},
    {"title": "Telur Gulung","img": "assets/images/telur_gulung.jpeg","jenis": "Makanan"},
    {"title": "Ikan", "img": "assets/images/ikan.jpeg", "jenis": "Makanan"},
    {"title": "Moci", "img": "assets/images/moci.jpeg", "jenis": "Makanan"},
    {"title": "Dimsum", "img": "assets/images/dimsum.jpeg", "jenis": "Makanan"},
    {"title": "Pentol", "img": "assets/images/pentol.jpeg", "jenis": "Makanan"},

    // Minuman
    {"title": "Salad", "img": "assets/images/salad.jpeg", "jenis": "Minuman"},
    {"title": "Cendol", "img": "assets/images/cendol.jpeg", "jenis": "Minuman"},
    {"title": "Matcha", "img": "assets/images/matcha.jpeg", "jenis": "Minuman"},

    // Manis
    {"title": "Martabak Manis","img": "assets/images/martabak_manis.jpeg","jenis": "Manis"},
    {"title": "Pisang Coklat", "img": "assets/images/piscok.jpeg", "jenis": "Manis"},
    {"title": "Pukis", "img": "assets/images/pukis.jpeg", "jenis": "Manis"},
    {"title": "Kue Balok", "img": "assets/images/kue_balok.jpeg", "jenis": "Manis"},

    // Pedas
    {"title": "Martabak", "img": "assets/images/martabak.jpeg", "jenis": "Pedas"},
    {"title": "Rujak", "img": "assets/images/rujak.jpeg", "jenis": "Pedas"},
    {"title": "Mie Ayam", "img": "assets/images/mie_ayam.jpeg", "jenis": "Pedas"},
    {"title": "Ikan Goreng", "img": "assets/images/ikan.jpeg", "jenis": "Pedas"},

    // Panas
    {"title": "Soto Ayam", "img": "assets/images/soto.jpeg", "jenis": "Panas"},
    {"title": "Bakso", "img": "assets/images/baso.jpeg", "jenis": "Panas"},

    // Dingin
    {"title": "Es Campur", "img": "assets/images/es_campur.jpeg", "jenis": "Dingin"},
    {"title": "Jus Mangga", "img": "assets/images/jus_mangga.jpeg", "jenis": "Dingin"},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = selectedjenis == "All"
        ? items
        : items.where((i) => i["jenis"] == selectedjenis).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Rekomendasi Masakan"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 0, 114), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // === DROPDOWN ===
                DropdownButtonFormField(
                  value: selectedjenis,
                  dropdownColor: const Color(0xFF1A1A27),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Pilih kategori",
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: "All", child: Text("Semua")),
                    DropdownMenuItem(value: "Makanan", child: Text("Makanan")),
                    DropdownMenuItem(value: "Minuman", child: Text("Minuman")),
                    DropdownMenuItem(value: "Pedas", child: Text("Pedas")),
                    DropdownMenuItem(value: "Manis", child: Text("Manis")),
                    DropdownMenuItem(value: "Panas", child: Text("Panas")),
                    DropdownMenuItem(value: "Dingin", child: Text("Dingin")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedjenis = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // GRID VIEW
                Expanded(
                  child: GridView.builder(
                    itemCount: filteredItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      childAspectRatio: 0.70,
                    ),
                    itemBuilder: (context, i) {
                      return _foodCard(
                        filteredItems[i]["title"],
                        filteredItems[i]["img"],
                        filteredItems[i]["jenis"],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _foodCard(String title, String image, String jenis) {
    return Container(
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
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          ),
        ),
        child: Text(
          "$title ($jenis)",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
