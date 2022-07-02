import 'package:flutter/material.dart';
import 'package:orino_smart_village/registration.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal budget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PbHomePage(),
        initialRoute: '/login',
      routes: {
        '/login': (_) => const Login(),
        '/register': (_) => const Registration()

      }
    );
  }
}

class PbHomePage extends StatefulWidget {
  PbHomePage({Key? key}) : super(key: key);

  final String title = 'Orino Smart Village';

  @override
  _PbHomePageState createState() => _PbHomePageState();
}

class _PbHomePageState extends State<PbHomePage> {
  int _selectedIndex = 0;
  static const double iconSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(onPressed: () {Navigator.pushNamed(context, '/login'); }, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {Navigator.pushNamed(context, '/register');}, icon: const Icon(Icons.add)),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueAccent,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ar-icon.png'), size: iconSize), label: 'AR'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/scan-icon.png'), size: iconSize,), label: 'Scan'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/home-icon.png'), size: iconSize), label: 'Home'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/map-icon.png'), size: iconSize), label: 'Map',),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/profile-icon.png'), size: iconSize), label: 'Profile')
        ],
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      drawer: Drawer(
        child: Container(
          color: Colors.yellow,
          padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Text("Demo menu"),
        ),
      ),
    );
  }
}
