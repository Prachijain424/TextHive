// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/CameraScreen.dart';
import 'package:untitled1/screens/HomeScreen.dart';
import 'package:untitled1/screens/LoginScreen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Colors.yellow,
        secondaryHeaderColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),

    );
  }
}
