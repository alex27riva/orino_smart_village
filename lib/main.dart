import 'package:flutter/material.dart';
import 'package:orino_smart_village/ar.dart';
import 'package:orino_smart_village/profile.dart';
import 'package:orino_smart_village/registration.dart';
import 'package:orino_smart_village/scanner.dart';
import 'package:orino_smart_village/home.dart';
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
          '/scan': (_) => const Scanner()
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
    null,
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
                Navigator.pushNamed(context, '/login');
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
              icon: ImageIcon(AssetImage('assets/images/ar-icon.png'),
                  size: iconSize),
              label: 'AR'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/scan-icon.png'),
                size: iconSize,
              ),
              label: 'Scan'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/home-icon.png'),
                  size: iconSize),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/map-icon.png'),
                size: iconSize),
            label: 'Map',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/profile-icon.png'),
                  size: iconSize),
              label: 'Profile')
        ],
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      drawer: Drawer(
        child: Container(
          color: Colors.yellow,
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: const Text("Demo menu"),
        ),
      ),
    );
  }
}
