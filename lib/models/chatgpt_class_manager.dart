import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatGptClassManager {
  static Future<String> getMessage(String message) async {
    String chatGptToken = dotenv.env['CHATGPT_API_TOKEN'].toString();
    String chatGptUrl = dotenv.env['CHATGPT_URL'].toString();

    final loadedChatGptJson =
        await rootBundle.loadString('lib/utils/chatGpt_data.json');

    Map<String, dynamic> mapChatGpt = jsonDecode(loadedChatGptJson);

    mapChatGpt['messages'][1]['content'] = message;

    try {
      final response = await http.post(
        Uri.parse(chatGptUrl),
        body: jsonEncode(mapChatGpt),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $chatGptToken"
        },
      );
      final String aiResponse =
          jsonDecode(response.body)["choices"][0]['message']['content'];

      final responseToUtrf8 = latin1.encode(aiResponse);
      final String utf8ToString = utf8.decode(responseToUtrf8);
      return utf8ToString;
    } catch (e) {
      //
    }
    return '';
  }
}
