/*
 * 360_view.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:orino_smart_village/services/storage_service.dart';
import 'package:panorama/panorama.dart';

class View360 extends StatefulWidget {
  final String imageName;

  const View360({Key? key, this.imageName = ''}) : super(key: key);

  @override
  State<View360> createState() => _View360State();
}

class _View360State extends State<View360> {
  late Future<String> futureImageURL;
  final Storage storage = Storage();

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
  void initState() {
    futureImageURL = storage.downloadURL(widget.imageName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: futureImageURL,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Scaffold(
              body: Panorama(
                animSpeed: 1.0,
                sensorControl: SensorControl.Orientation,
                onViewChanged: onViewChanged,
                child: Image(image: CachedNetworkImageProvider(snapshot.data!)),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
        });
  }
}
