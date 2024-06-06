import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:prasantinilayam_sai_bhajans/bhajans.dart';
import 'package:prasantinilayam_sai_bhajans/events.dart';
import 'constants.dart';
import 'lyrics.dart';
class pg1 extends StatefulWidget {
  const pg1({super.key});

  @override
  State<pg1> createState() => _pg1State();
}

class _pg1State extends State<pg1> {

  int index=1;

  final screens=[
    lyrics(),
    bhajans(),
    events(),
  ];

  @override
  Widget build(BuildContext context) {

    final items=<Widget>[
      fun1("Lyrics"),
      fun1("Bhajans"),
      fun1("Events")
    ];

    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar:CurvedNavigationBar(
        color:constants.purplel,
        buttonBackgroundColor: constants.purpled,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        height: 50,
        index: index,
        items: items,
        onTap: (index)=>setState(()=>this.index=index)
      ),
    );
  }
}
Widget fun1(String s){
  return CircleAvatar(
    backgroundColor: constants.purplel,
    radius: 25,
    child: Padding(
      padding: EdgeInsets.all(1.0),
      child: Text(s,style: TextStyle(color: Colors.white,fontSize: 13),),
    ),
  );
}