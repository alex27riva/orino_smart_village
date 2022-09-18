import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/images.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final newPassRepeatController = TextEditingController();

  final String namePlaceholder = 'Nome Cognome';
  final String emailTemplate = 'nome.cognome@email.com';

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
            title:
                Text(AppLocalizations.of(context)!.changePasswordDialogTitle),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    // Current password
                    decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.currentPasswordField),
                    controller: currentPassController,
                    obscureText: true,
                  ),
                  // New password
                  TextField(
                    decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.newPasswordField),
                    controller: newPassController,
                    obscureText: true,
                  ),
                  // Repeat password
                  TextField(
                    decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.repeatPasswordField),
                    controller: newPassRepeatController,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.cancelButtonText)),
              TextButton(
                  onPressed: () {
                    changeEmail();
                  },
                  child: Text(AppLocalizations.of(context)!.confirmButtonText)),
            ],
          ),
        );

    // Change email dialog
    Future openChangeEmailDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.changeEmailDialogTitle,
                textAlign: TextAlign.center),
            //contentPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.newEmailField),
                    controller: currentPassController,
                  ),
                ],
              ),
            ),
            actions: [
              // Cancel
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.cancelButtonText)),
              // Confirm
              TextButton(
                  onPressed: () {
                    changePassword();
                  },
                  child: Text(AppLocalizations.of(context)!.confirmButtonText)),
            ],
          ),
        );

    // Delete profile dialog
    Future openDeleteProfileDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.deleteProfileDialogTitle),
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.deleteProfileConfirmation)
                ],
              ),
            ),
            actions: [
              // Cancel
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.cancelButtonText)),
              // Delete
              TextButton(
                  onPressed: () {
                    changePassword();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.deleteButtonText,
                    style: const TextStyle(color: Colors.red),
                  )),
            ],
          ),
        );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Column(children: <Widget>[
                      const Image(
                          image: AssetImage(ImageConstants.profilePlaceholder),
                          width: 100,
                          fit: BoxFit.fill,
                          height: 100),
                      RichText(
                          text: TextSpan(
                        text: namePlaceholder,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      )),
                      RichText(
                          text: TextSpan(
                              text: emailTemplate,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none))),
                    ])),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        // Change password
                        RichText(
                            text: TextSpan(
                          text: AppLocalizations.of(context)!
                              .profileChangePassword,
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
                        // Change email
                        RichText(
                            text: TextSpan(
                          text:
                              AppLocalizations.of(context)!.profileChangeEmail,
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
                        // Delete profiel
                        RichText(
                            text: TextSpan(
                          text: AppLocalizations.of(context)!
                              .profileDeleteProfile,
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
                        // Logout text and icon
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .profileLogoutButton),
                                    const IconButton(
                                      icon: Icon(Icons.exit_to_app),
                                      onPressed: null,
                                      disabledColor: Colors.black,
                                    )
                                  ]),
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ])));
  }
}
