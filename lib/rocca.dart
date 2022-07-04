import 'package:flutter/material.dart';
import 'images.dart' as images;

class Rocca extends StatelessWidget {
  const Rocca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: const <Widget>[
            Image(image: AssetImage(images.roccaTramonto))
          ],
        ),
      )
    );
  }
}