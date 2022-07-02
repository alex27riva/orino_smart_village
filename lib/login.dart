import 'package:flutter/material.dart';

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
                margin: const EdgeInsets.only(bottom: 16.0),
                child: const Text('Login')),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: const Text('Username')),
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
                        child: const Text('Password')),
                    const Flexible(
                      child: TextField(obscureText: true,),
                    )
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {print('Button pressed');},
              )],
            )
          ])),

    );
  }
  
}