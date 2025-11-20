import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  final Gemini gemini = Gemini.instance;

  Future<String> ask(String prompt) async {
    try {
      final resp = await gemini.text(prompt);
      return resp?.output ?? 'Tidak ada respon dari Gemini.';
    } catch (e) {
      return 'Error: \$e';
    }
  }
}
