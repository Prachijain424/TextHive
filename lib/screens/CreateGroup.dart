import 'package:flutter/material.dart';
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
        icon: const Icon(Icons.person, color: Colors.white,),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07"),
    ChatModel(
        name: "Person1",
        icon: const Icon(Icons.person, color: Colors.white,),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07"),
    ChatModel(
        name: "Person2",
        icon: const Icon(Icons.person, color: Colors.white,),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07"),
    ChatModel(
        name: "Person3",
        icon: const Icon(Icons.person, color: Colors.white,),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07"),
    ChatModel(
        name: "Person4",
        icon: const Icon(Icons.person, color: Colors.white,),
        currentMessage: "Hi",
        isGroup: false,
        time: "18:07"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contact", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              setState(() {
                contacts[index].selected ^= true;
                if(contacts[index].selected)
                  {
                    groups.add(contacts[index]);
                  }
              });
            },
            child: ContactCard(contact: contacts[index],)
          );
        }),
      backgroundColor: const Color(0xFFE1F5FE),
      );
  }
}
