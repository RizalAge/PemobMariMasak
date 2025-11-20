import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import '/pages/profile_page.dart';
import '/pages/splash_page.dart';
import '/pages/login_page.dart';
import '/pages/register_page.dart';
import '/pages/navigation_page.dart';
import '/pages/rekomendasi_page.dart';
import 'pages/resep_ai_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Gemini
  Gemini.init(apiKey: 'AIzaSyDh2sA9cisnwRHXNSFpUqzJ4Xz6fwQFM6w');

  runApp(const MauMamApp());
}

class MauMamApp extends StatelessWidget {
  const MauMamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MauMam',
      theme: ThemeData(primarySwatch: Colors.blue),

      // Halaman awal
      initialRoute: '/',

      onGenerateRoute: (settings) {
        switch (settings.name) {

          case '/':
            return MaterialPageRoute(builder: (_) => const SplashPage());

          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());

          case '/register':
            return MaterialPageRoute(builder: (_) => const RegisterPage());

          case '/home':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => NavigationPage(
                user: {
                  'name': args['name']!,
                  'email': args['email']!,
                },
              ),
            );

          // ROUTE REKOMENDASI 
          case '/rekomendasi':
            return MaterialPageRoute(
              builder: (_) => const RekomendasiPage(),
            );

          //  ROUTE TANYA AI
          case '/ai':
            return MaterialPageRoute(
              builder: (_) => const ResepAIPage(),
            );

          case '/profile':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => ProfilePage(
                name: args['name']!,
                email: args['email']!,
              ),
            );

          default:
            return null;
        }
      },
    );
  }
}
