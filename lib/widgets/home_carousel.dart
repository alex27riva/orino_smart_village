import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:orino_smart_village/models/post_list.dart';

class HomeCarousel extends StatelessWidget {
  final Future<PostList> futurePost;

  const HomeCarousel({Key? key, required this.futurePost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostList>(
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
        });
  }
}
