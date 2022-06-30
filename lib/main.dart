import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:womesk_scanner/screens/switch_screen.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      home: Womesk(),
    );
  }
}
