import 'package:flutter/material.dart';

import '../view/chat_page.dart';

class AiSelector extends StatelessWidget {
  final String aiName;
  final String asset;
  const AiSelector({
    super.key,
    required this.aiName,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatPage(
                selection: true,
                aiName: aiName,
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 0),
            width: 160,
            height: 160,
            child: Image.asset(asset),
          ),
        ),
        Row(
          children: [
            RichText(
              text: const TextSpan(
                text: 'Chat',
                style: TextStyle(fontSize: 33),
              ),
            ),
            RichText(
              text: const TextSpan(
                text: 'GPT',
                style: TextStyle(fontSize: 38),
              ),
            ),
          ],
        )
      ],
    );
  }
}
