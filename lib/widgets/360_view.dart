import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class View360 extends StatelessWidget {
  final String imageUrl;

  const View360({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Panorama(
      child: Image(image: CachedNetworkImageProvider(imageUrl)),
    ));
  }
}
