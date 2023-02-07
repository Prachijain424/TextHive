import 'package:flutter/material.dart';

import '../CustomUI/StatusPage/HeadOwnStatus.dart';
class  extends StatefulWidget {
  const ({Key? key}) : super(key: key);

  @override
  State<> createState() => _State();
}

class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
      height : 48,
      child : FloatingActionButton(
      backgroundColor: Colors.blueGrey[100],
      elevation :8,

      onPressed: () {},
       child: Icon(Icons.edit,color:Colors.blueGrey[900],
),
),
      ),
    SizedBox(height: 13,),
    FloatingActionButton(onPressed:
     () {},
     backgroundColor: Colors.greenAccent[200],

     elevation :5,
     child: Icon(Icons.camera_alt),
)

],
    ),
   body: SingleChildScrollView(
   child: Column(
   children :[
     SizedBox(
    height:10,),
     HeadOwnStatus(),
],
),
)
    );
  }
}
