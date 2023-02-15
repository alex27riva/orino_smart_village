/*
 * orino_app.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/screens/ar_webview.dart';
import 'package:orino_smart_village/screens/feed.dart';
import 'package:orino_smart_village/screens/home.dart';
import 'package:orino_smart_village/screens/map.dart';
import 'package:orino_smart_village/screens/scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrinoApp extends StatefulWidget {
  const OrinoApp({Key? key}) : super(key: key);

  final String title = 'Orino Smart Village';

  @override
  State<OrinoApp> createState() => _OrinoAppState();
}

class _OrinoAppState extends State<OrinoApp> {
  // Home = 2
  int _currentIndex = 2;
  late PageController _pageController;
  late List<Widget> _screens;

  static const double iconSize = 35;

  @override
  void initState() {
    super.initState();
    _screens = [
      const ArWebView(),
      const Scanner(),
      const Home(),
      const MapPage(),
      const Feed(),
    ];
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
      body: PageView(
        controller: _pageController,
        // disable scrolling
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blue,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
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
              icon: Icon(Icons.feed, size: iconSize), label: 'Feed'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('OrinoSmartVillage',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Image(
                      image: AssetImage(ImageConstants.osvLogo),
                      width: 100.0,
                      height: 50.0),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.accessibility_new_outlined),
              title: Text(AppLocalizations.of(context)!.onboardingTitle),
              onTap: () {
                Navigator.pushNamed(context, '/onboarding');
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: Text(AppLocalizations.of(context)!.contactsTitle),
              onTap: () {
                Navigator.pushNamed(context, '/contacts');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(AppLocalizations.of(context)!.settingsTitle),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(AppLocalizations.of(context)!.aboutTitle),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            // Terms & conditions
            const Divider(
              height: 20,
            ),
            InkWell(
              onTap: null,
              // onTap: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const WebViewPage(
              //             url: '',
              //             title: "Terms & conditions",
              //           )));
              // },
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context)!.termsAndConditions,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
