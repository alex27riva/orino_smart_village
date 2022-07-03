import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/carousel/rocca-tramonto.jpg',
  'assets/images/carousel/territorio.jpg'
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Container(
                child: CarouselSlider(
              options: CarouselOptions(),
              items: imgList
                  .map((item) => Container(
                        child: Center(child: Image(image: AssetImage(item))),
                      ))
                  .toList(),
            )),
          ])),
    );
  }
}
