import 'package:flutter/material.dart';
import 'package:orino_smart_village/screens/ar.dart';
import 'package:orino_smart_village/screens/feed.dart';
import 'package:orino_smart_village/screens/map.dart';
import 'package:orino_smart_village/pages/registration.dart';
import 'package:orino_smart_village/pages/rocca.dart';
import 'package:orino_smart_village/screens/scanner.dart';
import 'package:orino_smart_village/screens/home.dart';
import 'package:orino_smart_village/pages/settings.dart';
import 'package:orino_smart_village/pages/about.dart';
import 'package:orino_smart_village/pages/cantine.dart';
import 'package:orino_smart_village/pages/contacts.dart';
import 'package:orino_smart_village/pages/login.dart';
import 'package:orino_smart_village/widgets/360_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:orino_smart_village/constants/images.dart';

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
        initialRoute: '/home',
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
  final PageStorageBucket bucket = PageStorageBucket();

  static const double iconSize = 50;
  final List<Widget> _screens = [
    const ArView(
      key: PageStorageKey('ar'),
    ),
    const Scanner(
      key: PageStorageKey('scanner'),
    ),
    Home(
      key: const PageStorageKey('home'),
    ),
    const MapPage(
      key: PageStorageKey('map'),
    ),
    Feed(
      key: const PageStorageKey('feed'),
    ),
    // const Profile(
    //   key: PageStorageKey('profile'),
    // )
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
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/360');
              },
              icon: const Icon(Icons.panorama_fish_eye))
        ],
      ),
      //body: _screens[_currentIndex],
      body: PageStorage(
        bucket: bucket,
        child: _screens[_currentIndex],
      ),

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
              icon: const ImageIcon(AssetImage(ImageConstants.arIcon),
                  size: iconSize),
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
            icon: const ImageIcon(AssetImage(ImageConstants.mapIcon),
                size: iconSize),
            label: AppLocalizations.of(context)!.navbarMap,
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.feed, size: iconSize),
              label: 'Feed'),
        ],
      ),

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
            // ListTile(
            //   title: Text(AppLocalizations.of(context)!.registrationTitle),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/register');
            //   },
            // ),
            // ListTile(
            //   title: Text(AppLocalizations.of(context)!.loginTitle),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/login');
            //   },
            // ),
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
