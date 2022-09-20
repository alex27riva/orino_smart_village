import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:orino_smart_village/constants/images.dart';

const contactEmail = 'mailto:orinosmartvillage@gmail.com';
const contactInstagram = 'https://www.instagram.com/orinosmartvillage';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.contactsTitle),
        ),
        body: Container(
      margin: const EdgeInsets.only(left: 40, right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: const Image(
              image: AssetImage(ImageConstants.contactBanner),
            ),
          ),
          // Instagram
          Column(
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xffDDDDDD),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    final Uri url = Uri.parse(contactInstagram);
                    launchUrl(url);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 20,
                        color: Color(0xffE04D4D),
                      ),
                      //Spacer(),
                      Text(
                        "   @orinosmartvillage",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      )
                    ],
                  )),

              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xffDDDDDD),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    final Uri url = Uri.parse(contactEmail);
                    launchUrl(url);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.envelope,
                        size: 20,
                        color: Color(0xffE04D4D),
                      ),
                      //Spacer(),
                      Text(
                        "   orinosmartvillage@gmail.com",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      )
                    ],
                  )),

            ],
          ),

        ],
      ),
    ));
  }
}
