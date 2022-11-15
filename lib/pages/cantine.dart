/*
 * cantine.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/constants/urls.dart';
import 'package:orino_smart_village/pages/cellar_info.dart';
import 'package:orino_smart_village/widgets/home_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Cantine extends StatelessWidget {
  const Cantine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.homeButtonCellars,
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppLocalizations.of(context)!.cellarTitle,
                  style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.cellarDescription,
                  textAlign: TextAlign.center,
                ),
                GridView.count(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 1,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 25.0,
                  children: [
                    HomeButton(
                        text: AppLocalizations.of(context)!.burgettRatTitle,
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CellarInfo(
                                    content: AppLocalizations.of(context)!.cellarBurgettDescription,
                                    title: AppLocalizations.of(context)!
                                        .burgettRatTitle,
                                    imagePath: ImageConstants.burgett,
                                    externalUrl: URLS.burgettDiRat,
                                  )));
                        },
                        selector: 'image',
                        image: ImageConstants.burgett),
                    HomeButton(
                        text: AppLocalizations.of(context)!.cellarGesaTitle,
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CellarInfo(
                                    content: AppLocalizations.of(context)!.cellarGesaDescription,
                                    title: AppLocalizations.of(context)!
                                        .cellarGesaTitle,
                                    imagePath: ImageConstants.cantinaGesa,
                                    externalUrl: URLS.cantinaGesa,
                                  )));
                        },
                        selector: 'image',
                        image: ImageConstants.cantinaGesa),
                    HomeButton(
                        text: AppLocalizations.of(context)!.cellarMarianaTitle,
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CellarInfo(
                                    content: AppLocalizations.of(context)!.cellarMarianaDescription,
                                    title: AppLocalizations.of(context)!
                                        .cellarMarianaTitle,
                                    imagePath: ImageConstants.cantinaMariana,
                                    externalUrl: URLS.cantinaMariana,
                                  )));
                        },
                        selector: 'image',
                        image: ImageConstants.cantinaMariana),
                    HomeButton(
                        text: AppLocalizations.of(context)!.cellarFaelTitle,
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CellarInfo(
                                    content: AppLocalizations.of(context)!.cellarFaelDescription,
                                    title: AppLocalizations.of(context)!
                                        .cellarFaelTitle,
                                    imagePath: ImageConstants.fael,
                                    externalUrl: URLS.cantinaFael,
                                  )));
                        },
                        selector: 'image',
                        image: ImageConstants.fael),
                  ],
                ),
              ],
            )));
  }
}
