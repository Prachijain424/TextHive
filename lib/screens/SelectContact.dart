import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI/ContactCard.dart';
import 'package:untitled1/Models/ChatModel.dart';
import 'package:untitled1/screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  SelectContactState createState() => SelectContactState();
}

class SelectContactState extends State<SelectContact> {
  List<ChatModel> options = [
    ChatModel(
        name: "Create Contact",
        icon: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        currentMessage: "",
        isGroup: false,
        time: "",
        id: 1),
    ChatModel(
        name: "Create Group",
        icon: const Icon(
          Icons.group_add,
          color: Colors.white,
        ),
        currentMessage: "",
        isGroup: false,
        time: "",
        id: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Contact",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: "Invite a friend",
                    child: Text("Invite a friend"),
                  ),
                  const PopupMenuItem(
                    value: "Refresh",
                    child: Text("Refresh"),
                  ),
                ];
              }),
        ],
      ),
      body: ListView(
        children: [
          InkWell(onTap: () {}, child: ContactCard(contact: options[0])),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const CreateGroup()));
              },
              child: ContactCard(contact: options[1])),
        ],
      ),
      backgroundColor: const Color(0xFFE1F5FE),
    );
  }
}
