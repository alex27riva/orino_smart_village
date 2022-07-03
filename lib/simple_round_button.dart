import 'package:flutter/material.dart';

class SimpleRoundButton extends StatelessWidget {
  final Color? backgroundColor;
  final Text? buttonText;
  final Function? onPressed;

  SimpleRoundButton({this.backgroundColor, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
                overlayColor: MaterialStateProperty.all(backgroundColor),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: buttonText,
                  ),
                ],
              ),
              onPressed: () => onPressed!(),
            ),
          ),
        ],
      ),
    );
  }
}
