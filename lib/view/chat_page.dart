// ignore_for_file: avoid_print

import 'package:ai_app_conversations/provider/get_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'messages_card.dart';

class ChatPage extends StatelessWidget {
  final String aiName;
  final bool selection;
  const ChatPage({super.key, required this.aiName, required this.selection});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final GetMessage aiMessage = Provider.of<GetMessage>(context);
    final totalHeightSize =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          aiName,
        ),
        leading: IconButton(
            onPressed: () {
              aiMessage.clanMessages();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: totalHeightSize * .865,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    height: totalHeightSize * .7,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ListView.builder(
                      reverse: true,
                      itemCount: aiMessage.messagesLength,
                      itemBuilder: (ctx, index) {
                        final data = aiMessage.messages[index];
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Messages(
                            data: data,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: totalHeightSize * .082,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextField(
                      onEditingComplete: () {
                        aiMessage.setMessage(
                            selection, Who.user, controller.text);
                        controller.clear();
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: const Text(
                          'Type a message or question',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .2,
                    child: IconButton.outlined(
                      onPressed: () {
                        aiMessage.setMessage(
                            selection, Who.user, controller.text);
                        controller.clear();
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
