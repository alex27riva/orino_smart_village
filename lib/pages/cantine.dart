import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:orino_smart_village/constants/images.dart';

//button border
RoundedRectangleBorder buttonBorder = RoundedRectangleBorder(
    side: const BorderSide(
        color: Colors.black, width: 1.2, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(15));

const buttonSize = Size(140, 140);

const burgettUrl =
    "https://sites.google.com/view/orum-vocidalmargine/il-burghett-di-rat";
const gesaUrl =
    "https://sites.google.com/view/orum-vocidalmargine/la-cantina-du-la-gesa-sala-1";
const marianaUrl =
    "https://sites.google.com/view/orum-vocidalmargine/la-cantina-du-la-mariana";
const faelUrl =
    "https://sites.google.com/view/orum-vocidalmargine/la-cantina-dul-fael";

class Cantine extends StatelessWidget {
  const Cantine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openUrl (url) {
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cantine"),
        ),
        body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      fixedSize: buttonSize,
                      shape: buttonBorder,
                    ),
                    onPressed: () {
                      openUrl(burgettUrl);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(ImageConstants.burgett),
                            ),
                          ),
                          Text('Il Burgett di Ratt',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ]),
                  ),
                  // Cantina du la Gesa
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      fixedSize: buttonSize,
                      shape: buttonBorder,
                    ),
                    onPressed: () {
                      openUrl(gesaUrl);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(ImageConstants.cantina_gesa),
                              width: 90,
                              height: 90,
                            ),
                          ),
                          Text('Cantina du la Gesa',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // Cantina du la Mariana
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      fixedSize: buttonSize,
                      shape: buttonBorder,
                    ),
                    onPressed: () {
                      openUrl(marianaUrl);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(ImageConstants.cantina_mariana),
                              width: 90,
                              height: 90,
                            ),
                          ),
                          Text('Cantina du la Mariana',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ]),
                  ),
                  //Cantina dul Fael
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      fixedSize: buttonSize,
                      shape: buttonBorder,
                    ),
                    onPressed: () {
                      openUrl(faelUrl);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(ImageConstants.fael),
                            ),
                          ),
                          Text('La cantina dul Fael',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

