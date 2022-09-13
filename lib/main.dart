import 'package:flutter/material.dart';
import 'package:orino_smart_village/ar.dart';
import 'package:orino_smart_village/map.dart';
import 'package:orino_smart_village/profile.dart';
import 'package:orino_smart_village/registration.dart';
import 'package:orino_smart_village/rocca.dart';
import 'package:orino_smart_village/scanner.dart';
import 'package:orino_smart_village/home.dart';
import 'package:orino_smart_village/settings.dart';
import 'package:orino_smart_village/about.dart';
import 'package:orino_smart_village/cantine.dart';
import 'package:orino_smart_village/contacts.dart';
import 'package:orino_smart_village/login.dart';
import 'package:orino_smart_village/360_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'constants/images.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MainApp(),
        initialRoute: '/register',
        routes: {
          '/login': (_) => const Login(),
          '/register': (_) => const Registration(),
          '/scan': (_) => const Scanner(),
          '/about': (_) => const About(),
          '/home': (_) => const MainApp(),
          '/rocca': (_) => const Rocca(),
          '/contacts': (_) => const Contacts(),
          '/settings': (_) => const Settings(),
          '/cantine': (_) => const Cantine(),
          '/360': (_) => const View360(),
        });
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  final String title = 'Orino Smart Village';

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Home = 2
  int _currentIndex = 2;

  static const double iconSize = 50;
  final List _screens = [
    const ArView(),
    const Scanner(),
    Home(),
    const MapPage(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              icon: const Icon(Icons.help)),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/360');
          }, icon: const Icon(Icons.panorama_fish_eye))
        ],
      ),
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon:
                  const ImageIcon(AssetImage(ImageConstants.arIcon), size: iconSize),
              label: AppLocalizations.of(context)!.navbarAR),
          BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(ImageConstants.scanIcon),
                size: iconSize,
              ),
              label: AppLocalizations.of(context)!.navbarScanner),
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(ImageConstants.homeIcon),
                  size: iconSize),
              label: AppLocalizations.of(context)!.navbarHome),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(ImageConstants.mapIcon), size: iconSize),
            label: AppLocalizations.of(context)!.navbarMap,
          ),
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(ImageConstants.profileIcon),
                  size: iconSize),
              label: AppLocalizations.of(context)!.navbarProfile)
        ],
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.registrationTitle),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.loginTitle),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.settingsTitle),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.contactsTitle),
              onTap: () {
                Navigator.pushNamed(context, '/contacts');
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.aboutTitle),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
