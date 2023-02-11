import 'package:flutter/material.dart';
import '../CustomUI/StatusPage/OthersStatus.dart';

import '../CustomUI/StatusPage/HeadOwnStatus.dart';
class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => StatusPageState();
}

class StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
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
              //  SizedBox(
              // height:10,),
              HeadOwnStatus(),
              Container(
                height:33,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[300],
                child : Padding(
                  padding:  EdgeInsets.symmetric(horizontal:13,vertical:7),
                  child: Text("Recent updates"
                    ,style: TextStyle(fontSize:13,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


              OtherStatus(
                name: "Prachi Jain",
                imageName : "assets/DSC_5736.JPG",
                time :"01:27",

              ),
              OtherStatus(
                name: "Lalit ",
                imageName : "assets/DSC_5752.JPG",
                time :"01:27",

              ),
              OtherStatus(
                name: "person1",
                imageName : "assets/DSC_5737.JPG",
                time :"01:27",

              ),
              OtherStatus(
                name: "person2",
                imageName : "assets/DSC_5746.JPG",
                time :"01:27",

              ),

            ],
          ),
        )
    );
  }
}




