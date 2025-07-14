import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prasantinilayam_sai_bhajans/drop.dart';
import 'package:prasantinilayam_sai_bhajans/durge_durge.dart';
import 'package:prasantinilayam_sai_bhajans/events.dart';
import 'package:prasantinilayam_sai_bhajans/homescreen.dart';
import 'package:prasantinilayam_sai_bhajans/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "",
          appId: "",
          messagingSenderId:"",
          projectId: "")
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      home: durge_durge()
    );
  }
}
