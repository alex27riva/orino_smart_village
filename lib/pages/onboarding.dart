import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/widgets/orino_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: AppLocalizations.of(context)!.onboardFirstPageTitle,
              body: AppLocalizations.of(context)!.onboardFirstPageBody,
              image: buildImage(ImageConstants.mountainTourist),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: AppLocalizations.of(context)!.onboardSecondPageTitle,
              body: AppLocalizations.of(context)!.onboardSecondPageBody,
              image: buildImage(ImageConstants.qrcodeScanning),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: AppLocalizations.of(context)!.onboardThirdPageTitle,
              body: AppLocalizations.of(context)!.onboardThirdPageBody,
              footer: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
                onPressed: () {
                  _storeOnboardInfo();
                  goToHome(context);
                },
                child: Text(AppLocalizations.of(context)!.startText),
              ),
              image: buildImage(ImageConstants.happyFamilyStart),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text(AppLocalizations.of(context)!.startText,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white)),
          onDone: () {
            _storeOnboardInfo();
            goToHome(context);
          },
          showSkipButton: true,
          skip: Text(AppLocalizations.of(context)!.skipText,
              style: const TextStyle(color: Colors.white)),
          onSkip: () => goToHome(context),
          next: const Icon(Icons.arrow_forward, color: Colors.white),
          dotsDecorator: getDotDecoration(),
          globalBackgroundColor: Theme.of(context).primaryColor,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OrinoApp()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        activeColor: Colors.white,
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
