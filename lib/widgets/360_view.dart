import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class View360 extends StatefulWidget {
  final String imageUrl;

  const View360({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<View360> createState() => _View360State();
}

class _View360State extends State<View360> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Panorama(
      animSpeed: 1.0,
      sensorControl: SensorControl.Orientation,
      onViewChanged: onViewChanged,
      child: Image(image: CachedNetworkImageProvider(widget.imageUrl)),
    ));
  }
}
