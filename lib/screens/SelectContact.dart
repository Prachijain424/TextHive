import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI/ContactCard.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  SelectContactState createState() => SelectContactState();
}

class SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contact", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
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
        children: const [
          ContactCard(icon: Icon(Icons.person_add, color: Colors.white), title: "New contact",),
          ContactCard(icon: Icon(Icons.group_add, color: Colors.white), title: "New group",),
        ],
      ),
      backgroundColor: const Color(0xFFE1F5FE),
    );
  }
}
