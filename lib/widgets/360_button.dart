/*
 * 360_button.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/widgets/360_view.dart';

class PanoramicButton extends StatelessWidget {
  final String panoramicImageUrl;

  const PanoramicButton({Key? key, required this.panoramicImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  View360(imageUrl: panoramicImageUrl),
            ));
      },
      splashRadius: 60.0,
      iconSize: 100.0,
      icon: const ImageIcon(AssetImage(ImageConstants.icon360)),
    );
  }
}
