import 'package:flutter/material.dart';
import 'package:untitled1/Models/ChatModel.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({Key? key, required this.contact})
      : super(key: key);
  final ChatModel contact;

  @override
  ContactCardState createState() => ContactCardState();
}

class ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    if(widget.contact.selected == false)
      {
        return ListTile(
          minVerticalPadding: 30,
          leading: Stack(children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.lightBlue,
              child: widget.contact.icon,
            ),
          ]),
          title: Text(
            widget.contact.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }
    return ListTile(
      minVerticalPadding: 30,
      leading: Stack(children: [
        CircleAvatar(
          radius: 23,
          backgroundColor: Colors.lightBlue,
          child: widget.contact.icon,
        ),
        const CircleAvatar(
          radius: 11,
          backgroundColor: Colors.teal,
          child: Icon(Icons.check, color: Colors.white, size: 18,),
        )
      ]),
      title: Text(
        widget.contact.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
