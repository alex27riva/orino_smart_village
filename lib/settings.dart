import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    const double lineThickness = 0.7;
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settingsTitle),
        ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Language

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(AppLocalizations.of(context)!.languageText),
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: lineThickness,
                        indent: 20,
                        endIndent: 10),
                  ),
                ],
              ),

              // Dark theme
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(AppLocalizations.of(context)!.themeText),
                      Switch(
                          value: darkThemeState,
                          onChanged: (newValue) {
                            setState(() => darkThemeState = newValue);
                          })
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: lineThickness,
                        indent: 20,
                        endIndent: 10),
                  ),
                ],
              ),
              // Notifiche
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(AppLocalizations.of(context)!.notificationText),
                      Switch(
                          value: notificationState,
                          onChanged: (newValue) {
                            setState(() => notificationState = newValue);
                          })
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: lineThickness,
                        indent: 20,
                        endIndent: 10),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
