import 'package:flutter/material.dart';
import 'package:orino_smart_village/simple_round_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accedi'),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    text: "Accedi con il tuo account",
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
              child: Row(
                children: const <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Indirizzo email",
                          hintText: "Inserisci l'indirizzo email",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Row(children: const <Widget>[
                Flexible(
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
                ),
              ]),
            ),
            SimpleRoundButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              backgroundColor: const Color(0xffe04d4d),
              buttonText: const Text(
                "Login",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ])),
    );
  }
}
