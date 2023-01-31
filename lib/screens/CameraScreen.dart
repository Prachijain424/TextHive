import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  late Future<void> cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       FutureBuilder(
    //           future: cameraValue,
    //           builder: ((context, snapshot) {
    //             if (snapshot.connectionState == ConnectionState.done) {
    //               return CameraPreview(_cameraController);
    //             } else {
    //               return const Center(
    //                 child: CircularProgressIndicator(),
    //               );
    //             }
    //           })),
    //       Positioned(
    //         bottom: 0.0,
    //         child: Container(
    //           color: Colors.black,
    //           width: MediaQuery.of(context).size.width,
    //           child: Column(
    //             children: [
    //               Row(
    //                 children: [
    //                   IconButton(
    //                       onPressed: () {},
    //                       icon: const Icon(
    //                         Icons.flash_off,
    //                         color: Colors.white,
    //                         size: 28,
    //                       ))
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
