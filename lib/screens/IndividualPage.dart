import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Models/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  IndividualPageState createState() => IndividualPageState();
}

class IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: (){
        Navigator.pop(context);
        },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.arrow_back_ios_new, size: 24,),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.account_circle),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name, style: const TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),),
                const Text("Last seen today at 69:69", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
          PopupMenuButton<String>(onSelected: (value) {
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "View Contact",
                child: Text("View Contact"),
              ),
              const PopupMenuItem(
                value: "Media, links and docs",
                child: Text("Media, links and docs"),
              ),
              const PopupMenuItem(
                value: "Search",
                child: Text("Search"),
              ),
              const PopupMenuItem(
                value: "Wallpaper",
                child: Text("Wallpaper"),
              ),
              const PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              ),
            ];
          })
        ],

      ),
    );
  }
}
