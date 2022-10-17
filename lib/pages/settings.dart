import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

const double borderWidth = 1;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool darkThemeState = false;
  bool notificationState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsTitle),
      ),
      body: Container(
        margin: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Language
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: ListTile(
                shape: const Border(
                    bottom:
                        BorderSide(color: Colors.black, width: borderWidth)),
                leading: Text(AppLocalizations.of(context)!.languageText),
                trailing: DropDown(
                  items: const ["Italiano", "English"],
                  hint: const Text("Italiano"),
                  icon: const Icon(
                    Icons.expand_more,
                    color: Colors.blue,
                  ),
                  onChanged: print,
                ),
              ),
            ),
            // notifications
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: SwitchListTile(
                title: Text(AppLocalizations.of(context)!.notificationText),
                value: notificationState,
                shape: const Border(
                    bottom:
                        BorderSide(color: Colors.black, width: borderWidth)),
                onChanged: (value) {
                  setState(() => notificationState = value);
                },
              ),
            ),
            // dark theme
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: SwitchListTile(
                title: Text(AppLocalizations.of(context)!.themeText),
                value: darkThemeState,
                shape: const Border(
                    bottom:
                        BorderSide(color: Colors.black, width: borderWidth)),
                onChanged: (value) {
                  setState(() => darkThemeState = value);
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Text(
                  '${AppLocalizations.of(context)!.appVersion} ${snapshot.data!.version}');
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
