import 'package:ai_app_conversations/models/chatgpt_class_manager.dart';
import 'package:ai_app_conversations/models/gemini_class_manager.dart';
// import 'package:ai_app_conversations/models/gemini_class_manager.dart';
import 'package:flutter/material.dart';

class GetMessage with ChangeNotifier {
  final List<Map<Who, String>> _messages = [];

  List<Map<Who, String>> get messages => [..._messages].reversed.toList();
  get messagesLength => _messages.length;

  setMessage(bool selection, Who who, String message) {
    final payload = {who: message};
    _messages.add(payload);
    getAiResponse(selection, message);
    notifyListeners();
  }

  getAiResponse(bool selection, String message) async {
    if (selection) {
      final response = await ChatGptClassManager.getMessage(message);
      _messages.add({Who.responseAi: response});
    } else {
      final response = await GeminiClassManager.getMessage(message);
      _messages.add({Who.responseAi: response});
    }
    notifyListeners();
  }

  @override
  String toString() {
    return _messages.toString();
  }

  clanMessages() {
    _messages.clear();
  }
}

enum Who {
  user,
  responseAi,
}
