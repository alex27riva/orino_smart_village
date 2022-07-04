import 'package:flutter/material.dart';
import 'package:orino_smart_village/ar.dart';
import 'package:orino_smart_village/map.dart';
import 'package:orino_smart_village/profile.dart';
import 'package:orino_smart_village/registration.dart';
import 'package:orino_smart_village/scanner.dart';
import 'package:orino_smart_village/home.dart';
import 'about.dart';
import 'images.dart' as constants;
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Orino Smart Village',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
        initialRoute: '/register',
        routes: {
          '/login': (_) => const Login(),
          '/register': (_) => const Registration(),
          '/scan': (_) => const Scanner(),
          '/about': (_) => const About(),
          '/home': (_) => const Home(),
        });
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final String title = 'Orino Smart Village';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

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
              icon: ImageIcon(AssetImage(constants.arIcon), size: iconSize),
              label: 'AR'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(constants.scanIcon),
                size: iconSize,
              ),
              label: 'Scan'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(constants.homeIcon), size: iconSize),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(constants.mapIcon), size: iconSize),
            label: 'Map',
          ),
          BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage(constants.profileIcon), size: iconSize),
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
              title: const Text('Signin'),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text('Contacts'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
