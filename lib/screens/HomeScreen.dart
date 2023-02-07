import 'package:flutter/material.dart';
import 'package:untitled1/Models/ChatModel.dart';
import 'package:untitled1/Pages/CameraPage.dart';
import 'package:untitled1/screens/CreateGroup.dart';
import '../Pages/ChatPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.users, required this.currentUser})
      : super(key: key);
  final List<ChatModel> users;
  final ChatModel currentUser;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextHive"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(onSelected: (value) {
            if (value == "New Group") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const CreateGroup()));
            } else if (value == "Logout") {
              Navigator.pop(context);
            } else {
              print(value);
            }
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "New Group",
                child: Text("New Group"),
              ),
              const PopupMenuItem(
                value: "New Broadcast",
                child: Text("New Broadcast"),
              ),
              const PopupMenuItem(
                value: "Whatsapp Web",
                child: Text("Whatsapp Web"),
              ),
              const PopupMenuItem(
                value: "Starred Messages",
                child: Text("Starred Messages"),
              ),
              const PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              ),
              const PopupMenuItem(
                value: "Logout",
                child: Text("Logout"),
              ),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        const Text("Camera"),
        ChatPage(
          users: widget.users,
          currentUser: widget.currentUser,
        ),
          StatusPage(),
        const Text("4"),
      ]),
    );
  }
}
