import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:orino_smart_village/main.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Esplora le bellezze del territorio',
              body: '',
              image: buildImage('assets/images/onboarding/montain-tourist.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Scansiona i codici QR',
              body:
                  'Ottieni maggiori informazioni scansionando degli appositi codici QR',
              image: buildImage('assets/images/onboarding/qrcode-scanning.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Iniziamo!',
              body:
                  'Tocca il pulsante qui sotto per andare alla schermata principale',
              footer: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
                onPressed: () => goToHome(context),
                child: const Text("Inizia"),
              ),
              image:
                  buildImage('assets/images/onboarding/happy-family-start.jpg'),
              decoration: getPageDecoration(),
            ),
          ],
          done:
              const Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text('Salta', style: TextStyle(color: Colors.white)),
          onSkip: () => goToHome(context),
          next: const Icon(Icons.arrow_forward, color: Colors.white),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainApp()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
