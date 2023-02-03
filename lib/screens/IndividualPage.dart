import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI/OwnMessageCard.dart';
import 'package:untitled1/CustomUI/ReplyCard.dart';
import 'package:untitled1/Models/ChatModel.dart';
import '../Widgets/IconCreation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  IndividualPageState createState() => IndividualPageState();
}

class IndividualPageState extends State<IndividualPage> {
  late IO.Socket socket;

  void connect() {
    socket = IO.io('http://localhost:5000', <String, dynamic>{
      'transports': ['websocket'],
      'upgrade': false
    });
    socket.connect();
    socket.onConnect((data) => print("Connected"));
    socket.emit("/test", "Hello lalit");
    print(socket.connected);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/wallpaper.png",
          height: MediaQuery.of(context).size.height - 40,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 24,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: const TextStyle(
                          fontSize: 18.5, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Last seen today at 69:69",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) {
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
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 110,
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 55,
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.emoji_emotions),
                                  onPressed: () {},
                                ),
                                suffixIcon: Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.blue,
                                            context: context,
                                            builder: (builder) =>
                                                bottomSheet());
                                      },
                                      icon:
                                          const Icon(Icons.attach_file_rounded),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.camera_alt_rounded))
                                  ],
                                ),
                                border: InputBorder.none,
                                hintText: "Type a message"),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 238,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 35,
                ),
                iconCreation(
                    Icons.insert_drive_file, Colors.indigo, "Document"),
                const SizedBox(
                  width: 35,
                ),
                iconCreation(Icons.camera_alt_rounded, Colors.pink, "Camera"),
                const SizedBox(
                  width: 35,
                ),
                iconCreation(Icons.photo_sharp, Colors.purple, "Gallery"),
                const SizedBox(
                  width: 35,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 35,
                ),
                iconCreation(Icons.multitrack_audio_outlined,
                    Colors.deepOrangeAccent, "Audio"),
                const SizedBox(
                  width: 35,
                ),
                iconCreation(Icons.map, Colors.green, "Location"),
                const SizedBox(
                  width: 35,
                ),
                iconCreation(Icons.contact_page, Colors.lightBlue, "Contact"),
                const SizedBox(
                  width: 35,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
