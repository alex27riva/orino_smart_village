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
import 'package:orino_smart_village/constants/urls.dart';
import 'package:orino_smart_village/utils/rest_api.dart';
import 'package:orino_smart_village/models/post_list.dart';
import 'package:orino_smart_village/widgets/home_button.dart';
import 'package:orino_smart_village/widgets/home_carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  late Future<PostList> futurePost;
  ApiService api = ApiService(URLS.baseApiUrl);

  @override
  void initState() {
    futurePost = api.getPosts(perPage: 10);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(children: <Widget>[
          HomeCarousel(futurePost: futurePost),
          Container(
            margin: const EdgeInsets.only(left: 32.0, right: 32.0, top: 50.0),
            child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 1,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                padding: const EdgeInsets.only(left: 25, right: 25),
                children: [
                  HomeButton(
                      text: AppLocalizations.of(context)!.homeButtonEcomuseum,
                      onPress: () => {
                            Alert(
                                    message: AppLocalizations.of(context)!.shortlyText,
                                    shortDuration: true)
                                .show()
                          },
                      icon: FontAwesomeIcons.buildingColumns),
                  // Rocca di orino
                  HomeButton(
                      text: AppLocalizations.of(context)!.homeButtonFortress,
                      onPress: () => {Navigator.pushNamed(context, '/rocca')},
                      icon: FontAwesomeIcons.fortAwesome),
                  // Ecoturismo
                  HomeButton(
                      text: AppLocalizations.of(context)!.homeButtonEcoturism,
                      onPress: () => {
                            Alert(
                                    message: AppLocalizations.of(context)!.shortlyText,
                                    shortDuration: true)
                                .show()
                          },
                      icon: FontAwesomeIcons.leaf),
                  // Cantine
                  HomeButton(
                      text: AppLocalizations.of(context)!.homeButtonCellars,
                      onPress: () => {Navigator.pushNamed(context, '/cantine')},
                      icon: FontAwesomeIcons.dungeon)
                ]),
          )
        ]));
  }
}
