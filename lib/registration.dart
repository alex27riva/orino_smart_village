import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.registrationTitle),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
          // Title
          child: RichText(
                textAlign: TextAlign.justify,
                text:  TextSpan(
                  text: AppLocalizations.of(context)!.registrationSubtitle,
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
              child: Flexible(
                child: TextField(
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.registrationName,
                        hintText: AppLocalizations.of(context)!.registrationNameHint,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))))),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Flexible(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.emailFieldText,
                          hintText: AppLocalizations.of(context)!.emailFieldText,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))))),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Flexible(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.passwordFieldText,
                          hintText: AppLocalizations.of(context)!.passwordFieldHint,
                          border: const OutlineInputBorder(
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
                  child: Text(AppLocalizations.of(context)!.registrationRegisterButton),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
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
                  TextSpan(
                      text: AppLocalizations.of(context)!.registrationAlreadyHaveAccount,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none)),
                  TextSpan(
                    text: AppLocalizations.of(context)!.registrationLogin,
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
