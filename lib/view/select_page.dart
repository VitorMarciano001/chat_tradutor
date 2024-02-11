import 'package:flutter/material.dart';

import '../components/ai_selector.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE9A04C),
              Color(0xFFE5564B),
            ],
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0x8E4D2424),
            ),
            height: 300,
            width: double.maxFinite,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AiSelector(
                  aiName: 'Gemini',
                  asset: 'assets/icons/gemini_logo.png',
                ),
                AiSelector(
                  aiName: 'ChatGpt',
                  asset: 'assets/icons/chatgpt.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
