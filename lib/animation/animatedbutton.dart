import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../files/Quicksitelink/uietsitelink.dart';



class AnimatedButton extends StatefulWidget {
  String urllink;
  String header;
  AnimatedButton({super.key, required this.header,required this.urllink});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  static  List<Color> colorizeColors = [
    Colors.grey.shade400,
    Colors.grey.shade500,
    Colors.grey.shade600
  ];

  static TextStyle colorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Horizon',
    shadows: [
      Shadow(
        color: Colors.grey.shade300,
        offset: const Offset(-3, -2),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Center(

      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            widget.header,
            speed: const Duration(milliseconds: 500),
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          )
        ],
        repeatForever: true,
        isRepeatingAnimation: true,
        // totalRepeatCount: 10,
        onTap: () {
          Weblink().weblaunch(widget.urllink);
        },
      ),
    );
  }
}
