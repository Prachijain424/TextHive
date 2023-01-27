import 'package:flutter/material.dart';

Widget iconCreation(IconData icon, Color color, String text) {
  return InkWell(
    onTap: (){},
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 28,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4,),
        Text(text)
      ],
    ),
  );
}