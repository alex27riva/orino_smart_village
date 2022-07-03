import 'package:flutter/material.dart';
import 'package:orino_smart_village/ar.dart';
import 'package:orino_smart_village/map.dart';
import 'package:orino_smart_village/profile.dart';
import 'package:orino_smart_village/registration.dart';
import 'package:orino_smart_village/scanner.dart';
import 'package:orino_smart_village/home.dart';
import 'about.dart';
import 'constants.dart' as constants;
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
              icon: ImageIcon(AssetImage(constants.arIcon),
                  size: iconSize),
              label: 'AR'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(constants.scanIcon),
                size: iconSize,
              ),
              label: 'Scan'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(constants.homeIcon),
                  size: iconSize),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(constants.mapIcon),
                size: iconSize),
            label: 'Map',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(constants.profileIcon),
                  size: iconSize),
              label: 'Profile')
        ],
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text("Signin"),
              Text("Login"),
              Text("Home"),
              Text("Profile"),
              Text("About"),
              Text("Contacts"),
              Text("Settings"),
            ],
          )
        ),
      ),
    );
  }
}
