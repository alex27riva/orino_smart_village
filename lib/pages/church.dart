/*
 * church.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/widgets/360_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChurchPage extends StatelessWidget {
  const ChurchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var descriptions = [
      AppLocalizations.of(context)!.churchFirstItem,
      AppLocalizations.of(context)!.churchSecondItem,
      AppLocalizations.of(context)!.churchThirdItem,
    ];
    var images = [
      ImageConstants.churchPanoramicIntName,
      ImageConstants.churchPanoramicExtName,
      ImageConstants.churchCemeteryName,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeButtonChurch),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: descriptions.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(descriptions[index]),
                trailing: PanoramicButton(
                    panoramicImageName: images[index], buttonSize: 80.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
