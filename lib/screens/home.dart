import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:orino_smart_village/constants/images.dart';
import 'package:orino_smart_village/utils/rest_api.dart';
import 'package:orino_smart_village/models/post_list.dart';
import 'package:orino_smart_village/widgets/home_button.dart';

final List<String> imgList = [
  ImageConstants.roccaTramonto,
  ImageConstants.territorio,
];

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  late Future<PostList> futurePost;

  @override
  void initState() {
    futurePost = ApiService.getPosts();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: <Widget>[
          FutureBuilder<PostList>(
              future: futurePost,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CarouselSlider(
                    options: CarouselOptions(),
                    items: snapshot.data!.posts
                        .where((curPost) => curPost.hasImageAvailable)
                        .map((item) => Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  item.featuredImage,
                                  fit: BoxFit.cover,
                                  width: 500,
                                ))))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
          // CarouselSlider(
          //   options: CarouselOptions(),
          //   items: imgList
          //       .map((item) => Center(
          //               child: ClipRRect(
          //             borderRadius: BorderRadius.circular(20.0),
          //             child: Image(
          //               image: AssetImage(item),
          //             ),
          //           )))
          //       .toList(),
          // ),
          Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Ecomuseo
                  HomeButton(
                      AppLocalizations.of(context)!.homeButtonEcomuseum,
                      buttonBackground,
                      () => {
                            Alert(
                                    message: 'Prossimamente!',
                                    shortDuration: true)
                                .show()
                          },
                      15,
                      icon: FontAwesomeIcons.buildingColumns),
                  // Rocca di orino
                  HomeButton(
                      AppLocalizations.of(context)!.homeButtonFortress,
                      buttonBackground,
                      () => {Navigator.pushNamed(context, '/rocca')},
                      15,
                      icon: FontAwesomeIcons.fortAwesome),
                ],
              )),
          // Second Row
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Ecoturismo
                HomeButton(
                    AppLocalizations.of(context)!.homeButtonEcoturism,
                    buttonBackground,
                    () => {
                          Alert(message: 'Prossimamente!', shortDuration: true)
                              .show()
                        },
                    15,
                    icon: FontAwesomeIcons.leaf),
                // Cantine
                HomeButton(
                    AppLocalizations.of(context)!.homeButtonCellars,
                    buttonBackground,
                    () => {Navigator.pushNamed(context, '/cantine')},
                    15,
                    icon: FontAwesomeIcons.dungeon),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
