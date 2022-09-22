import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.aboutTitle),
        ),
        body: Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Orino logo
                  const Image(
                      image: AssetImage(ImageConstants.comuneOrino),
                      height: 120,
                      width: 420),
                  // Cariplo logo
                  const Image(
                      image: AssetImage(ImageConstants.cariplo),
                      height: 100,
                      width: 400),
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: AppLocalizations.of(context)!
                                  .aboutFirstParagraph,
                              style: const TextStyle(
                                  leadingDistribution:
                                      TextLeadingDistribution.even,
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: AppLocalizations.of(context)!
                                  .aboutSecondParagraph,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ],
                      )),

                  const Image(
                      image: AssetImage(ImageConstants.insubria),
                      height: 100,
                      width: 400),
                ],
              ),
            )));
  }
}
