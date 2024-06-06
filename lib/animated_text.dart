import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class animated_text extends StatelessWidget {
  String t;
  animated_text( {super.key,required this.t});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];
    const colorizeTextStyle = TextStyle(
      fontSize: 25.0,
      fontFamily: 'Horizon',
    );
    return SizedBox(
      width: 300.0,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            t,
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
      ),
    );;
  }
}
