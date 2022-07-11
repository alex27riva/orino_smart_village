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

import 'images.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Orino Smart Village',
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
    const Home(),
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
        ],
      ),
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueAccent,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImageConstants.arIcon), size: iconSize),
              label: 'AR'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImageConstants.scanIcon),
                size: iconSize,
              ),
              label: 'Scan'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImageConstants.homeIcon), size: iconSize),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(ImageConstants.mapIcon), size: iconSize),
            label: 'Map',
          ),
          BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage(ImageConstants.profileIcon), size: iconSize),
              label: 'Profile')
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
              title: const Text('Registrati'),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            ListTile(
              title: const Text('Accedi'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              title: const Text('Su di noi'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text('Contatti'),
              onTap: () {
                Navigator.pushNamed(context, '/contacts');
              },
            ),
            ListTile(
              title: const Text('Impostazioni'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
