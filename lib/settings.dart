import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool darkThemeState = false;
  bool notificationState = false;
  String _chosenValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Impostazioni"),
      ),
        body: Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Language
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                text: "Impostazioni",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Lingua"),
                DropDown(
                  items: const ["Italiano", "English"],
                  hint: const Text("Italiano"),
                  icon: const Icon(
                    Icons.expand_more,
                    color: Colors.blue,
                  ),
                  onChanged: print,
                ),
              ],
            ),
          ),
          // Dark theme
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Tema scuro"),
                Switch(
                    value: darkThemeState,
                    onChanged: (newValue) {
                      setState(() => darkThemeState = newValue);
                    })
              ],
            ),
          ),
          // Notifiche
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Notifiche"),
                Switch(
                    value: notificationState,
                    onChanged: (newValue) {
                      setState(() => notificationState = newValue);
                    })
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
