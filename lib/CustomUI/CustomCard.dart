import 'package:flutter/material.dart';
import 'package:untitled1/Models/ChatModel.dart';
import 'package:untitled1/screens/IndividualPage.dart';

import '../Models/MessageModel.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chatModel;
  final ChatModel currentUser;
  final List<MessageModel> messages;
  const CustomCard(
      {Key? key,
      required this.chatModel,
      required this.currentUser,
      required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chatModel: chatModel,
                      currentUser: currentUser,
                      messages: messages,
                    )));
      },
      child: Column(children: [
        ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueGrey,
          ),
          title: Text(chatModel.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          subtitle: Row(
            children: [
              const Icon(Icons.done_all),
              const SizedBox(
                width: 3,
              ),
              Text(
                chatModel.currentMessage,
                style: const TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          trailing: Text(chatModel.time),
        ),
        const Divider(
          thickness: 0.0,
        )
      ]),
    );
  }
}
