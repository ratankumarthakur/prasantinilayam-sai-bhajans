import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prasantinilayam_sai_bhajans/animated_text.dart';
import 'package:prasantinilayam_sai_bhajans/constants.dart';
import 'package:prasantinilayam_sai_bhajans/homescreen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>pg1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.light,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width/2,
              child: Image.asset("assets/ganesh.png",fit: BoxFit.fill,),
              color: constants.light,),
            SizedBox(height: 10,),
           animated_text( t: "  Welcome to the world of \n            Spirituality",),
          ],
        ),
      ),
    );
  }
}
