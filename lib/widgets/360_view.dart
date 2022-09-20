import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class View360 extends StatelessWidget {
  const View360({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Panorama(
      child: Image.network(
          'https://images.pexels.com/photos/207385/pexels-photo-207385.jpeg?cs=srgb&dl=pexels-pixabay-207385.jpg&fm=jpg&w=8813&h=3147'),
    ));
  }
}
