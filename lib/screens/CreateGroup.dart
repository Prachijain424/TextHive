import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI/AvatarCard.dart';
import 'package:untitled1/CustomUI/ContactCard.dart';
import 'package:untitled1/Models/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  CreateGroupState createState() => CreateGroupState();
}

class CreateGroupState extends State<CreateGroup> {
  List<ChatModel> groups = [];

  List<ChatModel> contacts = [
    ChatModel(
      name: "Lalit",
      icon: const Icon(
        Icons.person,
        color: Colors.white,
      ),
      currentMessage: "Hi",
      isGroup: false,
      time: "18:07",
      id: 1,
    ),
    ChatModel(
        name: "Person1",
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07",
        id: 2),
    ChatModel(
        name: "Person2",
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07",
        id: 3),
    ChatModel(
        name: "Person3",
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07",
        id: 4),
    ChatModel(
        name: "Person4",
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07",
        id: 5),
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
        ],
      ),
      body: Stack(children: [
        ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groups.isNotEmpty ? 90 : 10,
                );
              }
              return InkWell(
                  onTap: () {
                    setState(() {
                      contacts[index - 1].selected ^= true;
                      if (contacts[index - 1].selected) {
                        groups.add(contacts[index - 1]);
                      }
                    });
                  },
                  child: ContactCard(
                    contact: contacts[index - 1],
                  ));
            }),
        groups.isNotEmpty
            ? Column(
                children: [
                  Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                groups.remove(contacts[index]);
                                contacts[index].selected = false;
                              });
                            },
                            child: AvatarCard(contact: contacts[index])),
                      )),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              )
            : Container(),
      ]),
      backgroundColor: const Color(0xFFE1F5FE),
    );
  }
}
