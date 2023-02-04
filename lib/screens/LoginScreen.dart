import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI/ContactCard.dart';
import 'package:untitled1/screens/HomeScreen.dart';

import '../Models/ChatModel.dart';
import '../Models/MessageModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late ChatModel currentUser;
  List<MessageModel> messages = [];
  List<ChatModel> users = [
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
        name: "Prachi",
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07",
        id: 2),
    ChatModel(
        name: "Person1",
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07",
        id: 3),
    ChatModel(
        name: "Person2",
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07",
        id: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => InkWell(
                child: ContactCard(contact: users[index]),
                onTap: () {
                  currentUser = users[index];
                  List<ChatModel> temp = [];
                  for (int i = 0; i < users.length; i++) {
                    temp.insert(i, users[i]);
                  }
                  temp.remove(currentUser);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => HomeScreen(
                                users: temp,
                                currentUser: currentUser,
                                messages: messages,
                              )));
                },
              )),
    );
  }
}
