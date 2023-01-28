import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({Key? key, required this.title, required this.icon}) : super(key: key);
  final Icon icon;
  final String title;

  @override
  ContactCardState createState() => ContactCardState();
}

class ContactCardState extends State<ContactCard> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        minVerticalPadding: 30,
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.lightBlue,
          child: widget.icon,
        ),
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold),),

      ),
    );
  }
}
