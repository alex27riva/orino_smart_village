import 'package:flutter/material.dart';
import 'constants.dart' as constants;

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Image(
                      image: AssetImage(constants.cariplo),
                      height: 100,
                      width: 400),
                  Container(
                   padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column (
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.justify,
                        text: const TextSpan(
                          text:
                          'Progetto sviluppato dall’Università dell’Insubria e dal Comune di Orino, finanziato da Fondazione Cariplo.',
                          style: TextStyle(
                              leadingDistribution: TextLeadingDistribution.even,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: const TextSpan(
                          text:
                          'Patrimonio storico-naturalistico e nella ricerca di soluzioni innovative per progettare lo sviluppo sostenibile del territorio.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  )),

                  const Image(
                      image: AssetImage(constants.insubria),
                      height: 100,
                      width: 400),
                ],
              ),
            )));
  }
}
