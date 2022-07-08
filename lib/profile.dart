import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'images.dart' as images;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final newPassRepeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void changePassword() {
      Navigator.of(context).pop();
    }

    void changeEmail() {
      Navigator.of(context).pop();
    }

    // Change password dialog
    Future openChangePasswordDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cambio password'),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintText: 'Inserisci la password attuale'),
                    controller: currentPassController,
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: 'Inserisci la nuova password'),
                    controller: newPassController,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Ripeti password'),
                    controller: newPassRepeatController,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Annulla')),
              TextButton(
                  onPressed: () {
                    changeEmail();
                  },
                  child: const Text('Conferma')),
            ],
          ),
        );

    // Change email dialog
    Future openChangeEmailDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cambio email', textAlign: TextAlign.center),
            //contentPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintText: 'Inserisci la nuova email'),
                    controller: currentPassController,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Annulla')),
              TextButton(
                  onPressed: () {
                    changePassword();
                  },
                  child: const Text('Conferma')),
            ],
          ),
        );

    // Delete profile dialog
    Future openDeleteProfileDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Eliminazione profilo'),
            content: SizedBox(
              height: 100,
              child: Column(
                children: const [
                  Text("Sei sicuro di voler eliminare l'account?")
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Annulla')),
              TextButton(
                  onPressed: () {
                    changePassword();
                  },
                  child: const Text(
                    'Elimina',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          ),
        );

    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(children: <Widget>[
                    const Image(
                        image: AssetImage(images.profilePlaceholder),
                        width: 100,
                        fit: BoxFit.fill,
                        height: 100),
                    RichText(
                        text: const TextSpan(
                      text: "Nome Cognome",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
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
                margin: const EdgeInsets.only(top: 80.0),
                child: Flexible(
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                        text: 'Cambia password',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => openChangePasswordDialog(),
                      )),
                      const Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 10),
                      RichText(
                          text: TextSpan(
                        text: 'Cambia email',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => openChangeEmailDialog(),
                      )),
                      const Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 10),
                      RichText(
                          text: TextSpan(
                            text: 'Elimina profilo',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => openDeleteProfileDialog(),
                          )),
                      const Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 10),
                    ],
                  )),
                ),
              ),
            ])));
  }
}
