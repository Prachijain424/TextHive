import 'package:flutter/material.dart';
import 'package:untitled1/Models/ChatModel.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  CallPageState createState() => CallPageState();
}

class CallPageState extends State<CallPage> {
  late List<ChatModel> users = [
    ChatModel(
        name: "Lalit",
        icon: const Icon(Icons.person),
        currentMessage: "Feb 12",
        isGroup: false,
        time: "14:26",
        id: 1),
    ChatModel(
        name: "Prachi",
        icon: const Icon(Icons.person),
        currentMessage: "Feb 12",
        isGroup: false,
        time: "14:26",
        id: 2),
    ChatModel(
        name: "Person1",
        icon: const Icon(Icons.person),
        currentMessage: "Feb 13",
        isGroup: false,
        time: "14:26",
        id: 3),
    ChatModel(
        name: "Person2",
        icon: const Icon(Icons.person),
        currentMessage: "Feb 14",
        isGroup: false,
        time: "14:26",
        id: 4),
    ChatModel(
        name: "Person3",
        icon: const Icon(Icons.person),
        currentMessage: "Feb 14",
        isGroup: false,
        time: "14:26",
        id: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Scaffold(
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => CallCard(users[index])),
      ),
    );
  }
}

Widget CallCard(ChatModel user) {
  return ListTile(
    leading: CircleAvatar(
      radius: 26,
      child: user.icon,
    ),
    title: Text(
      user.name,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      children: [
        const Icon(Icons.call_made),
        Text("${user.currentMessage} "),
        Text(user.time),
      ],
    ),
    trailing: InkWell(onTap: () {}, child: const Icon(Icons.call)),
  );
}
