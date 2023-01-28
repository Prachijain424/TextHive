import 'package:flutter/material.dart';
import 'package:untitled1/Models/ChatModel.dart';
import 'package:untitled1/screens/SelectContact.dart';
import '../CustomUI/CustomCard.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Lalit",
        icon: const Icon(Icons.person, color: Colors.white,),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07"),
    ChatModel(
        name: "Lalit",
        icon: const Icon(Icons.person, color: Colors.white,),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => const SelectContact()));
        },
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
