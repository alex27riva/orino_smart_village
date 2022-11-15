/*
 * home_button.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const buttonForeground = Color(0xff304d85);
const buttonBackground = Color(0xff90a955);

class HomeButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Color backColor;
  final VoidCallback onPress;
  final IconData? icon;
  final String? image;
  late final Widget child;
  final String selector;

  HomeButton(
      {Key? key,
      required this.text,
      this.backColor = buttonBackground,
      required this.onPress,
      this.textSize = 14,
      this.icon,
      this.image,
      this.selector = 'icon'})
      : super(key: key) {
    if (selector == 'icon') {
      child = FaIcon(icon, size: 72, color: buttonForeground);
    } else if (selector == 'image') {
      child = Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Image(image: AssetImage(image!), fit: BoxFit.contain, height: 80),
      );
    } else {
      child = Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Colors.black, width: 1.2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () {
        onPress();
      },
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        child,
        Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: textSize, color: Colors.black)),
      ]),
    );
  }
}
