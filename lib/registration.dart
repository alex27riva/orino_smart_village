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
                margin: const EdgeInsets.only(bottom: 16.0),
                child: const Text('Crea un account')),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: const Text('Nome e cognome')),
                  const Flexible(
                    child: TextField(),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: const Text('Indirizzo email')),
                    const Flexible(
                      child: TextField(),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: const Text('Password')),
                    const Flexible(
                      child: TextField(obscureText: true,),
                    )
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[ElevatedButton(
                child: const Text('Crea account'),
                onPressed: () {},
              )],
            )
          ])),

    );
  }
  
}