/*
 * courtyard.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/widgets/360_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Courtyard extends StatelessWidget {
  const Courtyard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var descriptions = [
      AppLocalizations.of(context)!.courtFirstItem,
      AppLocalizations.of(context)!.courtSecondItem,
      AppLocalizations.of(context)!.courtThirdItem,
      AppLocalizations.of(context)!.courtFourthItem,
    ];
    var images = [
      ImageConstants.courtyardOne,
      ImageConstants.courtyardTwo,
      ImageConstants.courtyardThree,
      ImageConstants.courtyardFour,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeButtonCourtyard),
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
