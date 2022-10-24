import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:orino_smart_village/pages/onboarding.dart';
import 'package:orino_smart_village/pages/webview.dart';
import 'package:orino_smart_village/screens/ar_webview.dart';
import 'package:orino_smart_village/screens/feed.dart';
import 'package:orino_smart_village/screens/map.dart';
import 'package:orino_smart_village/pages/rocca.dart';
import 'package:orino_smart_village/screens/scanner.dart';
import 'package:orino_smart_village/screens/home.dart';
import 'package:orino_smart_village/pages/settings.dart';
import 'package:orino_smart_village/pages/about.dart';
import 'package:orino_smart_village/pages/cantine.dart';
import 'package:orino_smart_village/pages/contacts.dart';
import 'package:orino_smart_village/widgets/360_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

final InAppLocalhostServer localhostServer = InAppLocalhostServer(port: 8080);
int? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.location.request();
  SharedPreferences prefs = await SharedPreferences.getInstance();
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: isViewed != 0 ? const OnBoardingPage() : const MainApp(),
        routes: {
          '/scan': (_) => const Scanner(),
          '/about': (_) => const About(),
          '/home': (_) => const MainApp(),
          '/rocca': (_) => const Rocca(),
          '/contacts': (_) => const Contacts(),
          '/settings': (_) => const Settings(),
          '/cantine': (_) => const Cantine(),
          '/360': (_) => const View360(
                imageUrl: '',
              ),
          '/webview': (_) => const WebViewPage(),
          '/onboarding': (_) => const OnBoardingPage(),
        });
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  final String title = 'Orino Smart Village';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Home = 2
  int _currentIndex = 2;
  late PageController _pageController;
  late List<Widget> _screens;

  static const double iconSize = 50;

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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Image(
                      image: AssetImage('assets/images/logos/osv-logo.jpg'),
                      width: 100.0,
                      height: 50.0),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.accessibility_new_outlined),
              title: const Text("Introduzione"),
              onTap: () {
                Navigator.pushNamed(context, '/onboarding');
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
              leading: const Icon(Icons.contacts),
              title: Text(AppLocalizations.of(context)!.contactsTitle),
              onTap: () {
                Navigator.pushNamed(context, '/contacts');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
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
