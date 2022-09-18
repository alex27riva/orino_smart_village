import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//button border
RoundedRectangleBorder buttonBorder = RoundedRectangleBorder(
    side: const BorderSide(
        color: Colors.black, width: 1.2, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(15));

const buttonForeground = Color(0xff304d85);
const buttonBackground = Color(0xff90a955);
const buttonSize = Size(120, 120);

class HomeButton extends StatelessWidget {
  final String text;
  final int textSize;
  final Color backColor;
  final VoidCallback onPress;
  final IconData icon;

  const HomeButton(this.text, this.backColor, this.onPress, this.textSize,
      {Key? key, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: backColor,
        fixedSize: buttonSize,
        shape: buttonBorder,
      ),
      onPressed: () {
        onPress();
      },
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FaIcon(icon, size: 72, color: buttonForeground),
        Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black)),
      ]),
    );
  }
}
