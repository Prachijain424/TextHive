import 'package:flutter/material.dart';
import 'package:untitled1/Models/ChatModel.dart';
import 'package:untitled1/screens/SelectContact.dart';
import '../CustomUI/CustomCard.dart';
import '../Models/MessageModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {Key? key,
      required this.users,
      required this.currentUser,
      required this.messages})
      : super(key: key);
  final List<ChatModel> users;
  final ChatModel currentUser;
  final List<MessageModel> messages;

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
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
        itemCount: widget.users.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: widget.users[index],
          currentUser: widget.currentUser,
          messages: widget.messages,
        ),
      ),
    );
  }
}
