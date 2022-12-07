/*
 * 360_button.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/services/storage_service.dart';
import 'package:orino_smart_village/widgets/360_view.dart';

class PanoramicButton extends StatelessWidget {
  final String panoramicImageName;

  const PanoramicButton({Key? key, required this.panoramicImageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return FutureBuilder(
        future: storage.downloadURL(panoramicImageName),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => View360(imageUrl: snapshot.data!),
                    ));
              },
              splashRadius: 60.0,
              iconSize: 100.0,
              icon: const ImageIcon(AssetImage(ImageConstants.icon360)),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          // TODO: Disable button if image not available
          return Container();
        });
  }
}
