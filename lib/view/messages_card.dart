import 'package:ai_app_conversations/provider/get_message.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final Map<Who, String> data;
  const Messages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BubbleNormal(
      text: data.values.first,
      tail: false,
      isSender: data.keys.first == Who.user ? true : false,
    );
  }
}
