import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class GeminiClassManager {
  static Future<String> getMessage(String message) async {
    String geminiUrl = dotenv.env['GEMINI_URL'].toString();
    String geminiToken = dotenv.env['GEMINI_API_TOKEN'].toString();

    final loadedGeminiJson =
        await rootBundle.loadString('lib/utils/gemini_data.json');
    final Map<String, dynamic> mapGemini = jsonDecode(loadedGeminiJson);
    mapGemini['contents'][0]['parts'][0]['text'] =
        "You are a translator assistant and you have to "
        "translate this next word or message to Portuguese: $message";
    final url = Uri.parse('$geminiUrl$geminiToken');
    try {
      final response = await http.post(
        url,
        body: jsonEncode(mapGemini),
      );
      final String aiMessage = jsonDecode(response.body)['candidates'][0]
          ['content']['parts'][0]['text'];

      return aiMessage;
    } catch (e) {
      //
    }

    return '';
  }
}
