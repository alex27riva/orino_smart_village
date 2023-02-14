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

enum ChildType { icon, image, widget }

class BigButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Color backColor;
  final VoidCallback onPress;
  final IconData? icon;
  final String? image;
  final Widget? passedChild;
  late final Widget innerChild;
  final ChildType childType;

  BigButton(
      {Key? key,
      required this.text,
      this.backColor = buttonBackground,
      required this.onPress,
      this.textSize = 14.0,
      this.icon,
      this.image,
      this.passedChild,
      this.childType = ChildType.icon})
      : super(key: key) {
    if (childType == ChildType.icon) {
      innerChild = FaIcon(icon, size: 72.0, color: buttonForeground);
    } else if (childType == ChildType.image) {
      innerChild = Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Image(image: AssetImage(image!), fit: BoxFit.contain, height: 80),
      );
    } else {
      innerChild = passedChild ?? Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        elevation: 1,
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onPressed: () {
        onPress();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 2, child: innerChild),
              Flexible(
                flex: 1,
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: textSize, color: Colors.black)),
              ),
            ]),
      ),
    );
  }
}
