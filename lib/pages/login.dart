/*
 * login.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.loginTitle),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.loginSubtitle,
                    style: const TextStyle(
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
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.emailFieldText,
                          hintText: AppLocalizations.of(context)!.emailFieldHint,
                          border: const OutlineInputBorder(
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
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.passwordFieldText,
                          hintText: AppLocalizations.of(context)!.passwordFieldText,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3))),
                      obscureText: true),
                ),
              ]),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                AppLocalizations.of(context)!.loginSubmitText,
              ),
            ),
          ])),
    );
  }
}
