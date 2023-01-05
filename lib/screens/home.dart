/*
 * home.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/widgets/big_button.dart';
import 'package:orino_smart_village/widgets/home_carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Expanded(child: HomeCarousel()),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      children: [
                        // Chiesa
                        BigButton(
                            text:
                                AppLocalizations.of(context)!.homeButtonChurch,
                            onPress: () =>
                                {Navigator.pushNamed(context, '/church')},
                            icon: FontAwesomeIcons.church),
                        // Rocca di orino
                        BigButton(
                            text: AppLocalizations.of(context)!
                                .homeButtonFortress,
                            onPress: () =>
                                {Navigator.pushNamed(context, '/rocca')},
                            icon: FontAwesomeIcons.fortAwesome),
                        // Ecoturismo
                        BigButton(
                          childType: ChildType.widget,
                          text:
                              AppLocalizations.of(context)!.homeButtonCourtyard,
                          onPress: () =>
                              {Navigator.pushNamed(context, '/courtyard')},
                          //image: ImageConstants.fence),
                          passedChild: const ImageIcon(
                            AssetImage(ImageConstants.fence),
                            color: Color(0xff304d85),
                            size: 70,
                          ),
                        ),
                        // Cantine
                        BigButton(
                            text:
                                AppLocalizations.of(context)!.homeButtonCellars,
                            onPress: () =>
                                {Navigator.pushNamed(context, '/cantine')},
                            icon: FontAwesomeIcons.dungeon)
                      ]),
                ),
              )
            ]));
  }
}
