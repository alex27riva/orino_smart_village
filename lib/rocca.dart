import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'images.dart' as images;

const roccaLocation = 'geo:45.8876175,8.7261915,17';

class Rocca extends StatelessWidget {
  const Rocca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rocca di Orino"),
        ),
        body: Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: const Image(
                image: AssetImage(images.roccaTramonto),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                  text:
                      "La Rocca di Orino è un'antica fortezza, situata a nord-est del comune, a 540 metri di altitudine. \n"
                      "Essa giace su di uno sperone roccioso che garantisce un'ottima visibilità su tutta la Valcuvia.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                )),
          ),
          // Show on map button container
          Container(
            margin: const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
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
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.mapLocationDot,
                      size: 20,
                      color: Color(0xffE04D4D),
                    ),
                    //Spacer(),
                    Text(
                      "   Mostra sulla mappa",
                      style: TextStyle(
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
    ));
  }
}
