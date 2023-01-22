import 'package:flutter/material.dart';

import '../CustomUI/CustomCard.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.chat),
      ),
      body: ListView(
        children: const [
          CustomCard(),
          CustomCard(),
          CustomCard()
        ],
      ),
    );
  }
}
