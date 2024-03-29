/*
 * main.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orino_smart_village/firebase_options.dart';
import 'package:orino_smart_village/models/language_settings.dart';
import 'package:orino_smart_village/pages/church.dart';
import 'package:orino_smart_village/pages/courtyard.dart';
import 'package:orino_smart_village/pages/dashboard.dart';
import 'package:orino_smart_village/pages/onboarding.dart';
import 'package:orino_smart_village/pages/webview.dart';
import 'package:orino_smart_village/pages/rocca.dart';
import 'package:orino_smart_village/screens/scanner.dart';
import 'package:orino_smart_village/pages/settings.dart';
import 'package:orino_smart_village/pages/about.dart';
import 'package:orino_smart_village/pages/cantine.dart';
import 'package:orino_smart_village/pages/contacts.dart';
import 'package:orino_smart_village/widgets/360_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:orino_smart_village/widgets/orino_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

final InAppLocalhostServer localhostServer = InAppLocalhostServer(port: 8080);
int? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.location.request();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // start the localhost server
  await localhostServer.start();
  isViewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageSettings(),
        )
      ],
      child: Consumer<LanguageSettings>(builder: (context, langValue, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)!.appTitle,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.ralewayTextTheme(),
            ),
            locale: Locale(langValue.lang),
            home: isViewed != 0 ? const OnBoardingPage() : const OrinoApp(),
            routes: {
              '/scan': (_) => const Scanner(),
              '/about': (_) => const About(),
              '/home': (_) => const OrinoApp(),
              '/rocca': (_) => const Rocca(),
              '/contacts': (_) => const Contacts(),
              '/settings': (_) => const Settings(),
              '/cantine': (_) => const Cantine(),
              '/church': (_) => const ChurchPage(),
              '/courtyard': (_) => const Courtyard(),
              '/360': (_) => const View360(),
              '/webview': (_) => const WebViewPage(),
              '/onboarding': (_) => const OnBoardingPage(),
              '/dashboard': (_) => const Dashboard(),
            });
      }),
    );
  }
}
