import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus({ Key ?key,required this.imageName,required this.time, required this.name}) : super(key: key);
  final String name;
  final String time;
  final String imageName;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading : CircleAvatar(
        radius:26,
       backgroundImage: AssetImage(imageName),
      ),
      title: Text(name, style: TextStyle(fontWeight : FontWeight.bold
          ,fontSize:15),
      ),
      subtitle: Text("Today at, $time " ,style: TextStyle(fontSize:14,
      color:Colors.grey[900]),
      ),
    );
  }
}
