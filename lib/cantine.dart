import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'images.dart' as images;

//button border
RoundedRectangleBorder buttonBorder = RoundedRectangleBorder(
    side: const BorderSide(
        color: Colors.black, width: 1.2, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(15));

const buttonSize = Size(120, 120);

const burgettUrl = "https://sites.google.com/view/orum-vocidalmargine/il-burghett-di-rat";
const gesaUrl = "https://sites.google.com/view/orum-vocidalmargine/la-cantina-du-la-gesa-sala-1";
const marianaUrl = "https://sites.google.com/view/orum-vocidalmargine/la-cantina-du-la-mariana";
const faelUrl = "https://sites.google.com/view/orum-vocidalmargine/la-cantina-dul-fael";

class Cantine extends StatelessWidget {
  const Cantine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  final Uri url = Uri.parse(burgettUrl);
                  launchUrl(url);
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(image: AssetImage(images.burgett),
                        fit: BoxFit.contain,
                      ),
                      Text('Il Burgett di Ratt',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black)),
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
                  final Uri url = Uri.parse(gesaUrl);
                  launchUrl(url);
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(image: AssetImage(images.cantina_gesa),
                        width: 90,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      Text('Cantina du la Gesa',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black)),
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
                  final Uri url = Uri.parse(marianaUrl);
                  launchUrl(url);
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(image: AssetImage(images.cantina_mariana),
                        width: 90,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                      Text('Cantina du la Mariana',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black)),
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
                  final Uri url = Uri.parse(faelUrl);
                  launchUrl(url);
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(image: AssetImage(images.fael),
                        fit: BoxFit.contain,
                      ),
                      Text('La cantina dul Fael',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                    ]),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
