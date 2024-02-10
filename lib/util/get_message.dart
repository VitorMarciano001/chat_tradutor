import 'package:flutter/material.dart';

import '../provider/generate_response.dart';

class GetMessage with ChangeNotifier {
  final List<Map<Who, String>> _messages = [];

  List<Map<Who, String>> get messages => [..._messages].reversed.toList();
  get messagesLength => _messages.length;

  setMessage(Who who, String message) {
    final temporaryMap = {who: message};
    _messages.add(temporaryMap);
    getAiResponse(message);
    notifyListeners();
  }

  getAiResponse(String message) async {
    final aiMessage = await ChatGptQuerys.getMessage(message);
    _messages.add({Who.gemini: aiMessage});
    notifyListeners();
  }

  @override
  String toString() {
    return _messages.toString();
  }
}

enum Who {
  user,
  gemini,
}
