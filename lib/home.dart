import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'images.dart' as images;

final List<String> imgList = [
  images.roccaTramonto,
  images.territorio,
];

const buttonForeground = Color(0xff304d85);
const buttonBackground = Color(0xff90a955);
const buttonSize = Size(120, 120);
//button border
RoundedRectangleBorder buttonBorder = RoundedRectangleBorder(
    side: const BorderSide(
        color: Colors.black, width: 1.2, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(15));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(),
            items: imgList
                .map((item) => Center(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: AssetImage(item),
                      ),
                    )))
                .toList(),
          ),
          Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Ecomuseo
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: buttonBackground,
                      fixedSize: buttonSize,
                      shape: buttonBorder,
                    ),
                    onPressed: () {
                      Alert(message: 'Prossimamente!', shortDuration: true)
                          .show();
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          //FaIcon(FontAwesomeIcons.fortAwesome, size: 75),
                          Text('Ecomuseo',
                              textAlign: TextAlign.end,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ]),
                  ),
                  // Rocca di Orino
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: buttonBackground,
                      fixedSize: buttonSize,
                      shape: buttonBorder,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/rocca');
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.fortAwesome,
                            size: 75,
                            color: buttonForeground,
                          ),
                          Text('Rocca di Orino',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ]),
                  ),
                ],
              )),
          // Second Row
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Ecoturismo
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: buttonBackground,
                    fixedSize: buttonSize,
                    shape: buttonBorder,
                  ),
                  onPressed: () {
                    Alert(message: 'Prossimamente!', shortDuration: true)
                        .show();
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        FaIcon(FontAwesomeIcons.leaf,
                            size: 75, color: buttonForeground),
                        Text('Ecoturismo',
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ]),
                ),
                // Cantine
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: buttonBackground,
                    fixedSize: buttonSize,
                    shape: buttonBorder,
                  ),
                  onPressed: null,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.dungeon,
                          size: 75,
                          color: buttonForeground,
                        ),
                        Text('Cantine',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ]),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
