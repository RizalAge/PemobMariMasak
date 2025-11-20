import 'package:flutter/material.dart';
import 'resep_ai_page.dart';
import 'rekomendasi_page.dart';
import 'beranda_page.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {
  final Map<String, String> user; // data user dari login

  const NavigationPage({super.key, required this.user});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _index = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const BerandaPage(),
      const RekomendasiPage(),
      const ResepAIPage(),
      ProfilePage(name: widget.user['name']!, email: widget.user['email']!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF12121A),
        selectedItemColor: const Color.fromARGB(255, 72, 94, 255),
        unselectedItemColor: Colors.white70,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome), 
            label: 'Rekomendasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology_alt_rounded), 
            label: 'Tanya AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
