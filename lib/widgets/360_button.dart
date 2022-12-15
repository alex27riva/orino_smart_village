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
  final String panoramicImageName;
  final double buttonSize;

  const PanoramicButton(
      {Key? key, required this.panoramicImageName, this.buttonSize = 100.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (panoramicImageName != '') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => View360(imageName: panoramicImageName),
              ));
        }
      },
      splashRadius: 40.0,
      iconSize: buttonSize,
      icon: const ImageIcon(AssetImage(ImageConstants.icon360)),
    );
  }
}
//
