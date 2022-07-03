import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(children: <Widget>[
                    const Image(
                        image: AssetImage(
                            'assets/images/profile-placeholder.png')),
                    RichText(
                        text: const TextSpan(
                      text: "Nome Cognome",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                    )),
                    RichText(
                        text: const TextSpan(
                            text: "email@email.com",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none))),
                  ])),
              Container(
                margin: const EdgeInsets.only(top: 100.0),
                child: Center(
                    child: Column(
                  children: const <Widget>[
                    Text('Cambia password', style: TextStyle(fontSize: 20)),
                    Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 10),
                    Text('Cambia email', style: TextStyle(fontSize: 20)),
                    Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 10),
                    Text('Elimina profilo',
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                    Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 10),
                  ],
                )),
              ),
            ])));
  }
}
