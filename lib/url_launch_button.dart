import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class test1 extends StatelessWidget {
  String s;
  test1({super.key,required this.s});

  @override
  Widget build(BuildContext context) {
    return
       ElevatedButton(
        onPressed: ()async{
          Uri _url=Uri.parse(s);
          if(await canLaunchUrl(_url)){
            await launchUrl(_url);
          }
        },
        child: Text('Play',),
      );

  }
}
