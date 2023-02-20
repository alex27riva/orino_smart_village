/*
 * network_unavailable.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NetworkUnavailable extends StatelessWidget {
  const NetworkUnavailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(AppLocalizations.of(context)!.networkErrorText,
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
        const Image(
          image: AssetImage(ImageConstants.noWifi),
          width: 100,
          height: 100,
        )
      ],
    );
  }
}
