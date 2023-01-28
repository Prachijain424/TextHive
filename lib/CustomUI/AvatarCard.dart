import 'package:flutter/material.dart';
import 'package:untitled1/Models/ChatModel.dart';
class AvatarCard extends StatefulWidget {
  const AvatarCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;
  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  @override
  Widget build(BuildContext context) {
    return widget.contact.selected ? Row(
      children: [Column(
          children: [
            Stack(children: const[
              Padding(
                padding: EdgeInsets.all(4),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.lightBlue,
                  child: Icon(Icons.person),
                ),
              ),
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.grey,
                child: Icon(Icons.clear, color: Colors.white, size: 18,),
              )
            ]),
            Text (widget.contact.name),
          ],
      ),
        const SizedBox(
          width: 20,
        )
      ]
    ) : Container();
  }
}
