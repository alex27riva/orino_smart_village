/*
 * cantine.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/widgets/home_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Cantine extends StatelessWidget {
  const Cantine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.homeButtonCellars,),
        ),
        body: Container(
            margin: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: GridView.count(
              padding: const EdgeInsets.only(left: 20, right: 20),
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 1,
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 25.0,
              children: [
                HomeButton(
                    text: "Il Burgett di Ratt",
                    onPress: () {},
                    selector: 'image',
                    image: ImageConstants.burgett),
                HomeButton(
                    text: "Cantina du la Gesa",
                    onPress: () {},
                    selector: 'image',
                    image: ImageConstants.cantinaGesa),
                HomeButton(
                    text: "Cantina du la Mariana",
                    onPress: () {},
                    selector: 'image',
                    image: ImageConstants.cantinaMariana),
                HomeButton(
                    text: "La cantina dul Fael",
                    onPress: () {},
                    selector: 'image',
                    image: ImageConstants.fael),
              ],
            )));
  }
}
