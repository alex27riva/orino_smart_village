import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrazione'),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
          child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                  text: "Crea un account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: const Flexible(
                child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nome e cognome",
                        hintText: "Inserisci Nome e Cognome",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))))),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: const Flexible(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: "Indirizzo email",
                          hintText: "Inserisci email",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))))),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: const Flexible(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Inserisci una password",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3))),
                      obscureText: true),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Crea account'),
                  onPressed: () {},
                )
              ],
            ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Non hai un account?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none)),
                  TextSpan(
                    text: ' Accedi',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(context, '/login'),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
