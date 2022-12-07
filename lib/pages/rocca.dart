/*
 * rocca.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orino_smart_village/widgets/360_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:orino_smart_village/constants/images.dart';

const roccaLocation = 'geo:45.8876175,8.7261915,17';

class Rocca extends StatelessWidget {
  const Rocca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.fortressOfOrino),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: const Image(
                      image: AssetImage(ImageConstants.roccaTramonto),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: AppLocalizations.of(context)!.fortressDescription,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            leadingDistribution: TextLeadingDistribution.even,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      )),
                ),
                const PanoramicButton(
                    panoramicImageUrl: ImageConstants.roccaPanoramic),
                // Show on map button container
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xffDDDDDD),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        final Uri url = Uri.parse(roccaLocation);
                        launchUrl(url);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.mapLocationDot,
                            size: 20,
                            color: Color(0xffE04D4D),
                          ),
                          //Spacer(),
                          Text(
                            AppLocalizations.of(context)!.showOnMapButton,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
