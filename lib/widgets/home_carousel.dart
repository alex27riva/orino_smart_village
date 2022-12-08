/*
 * home_carousel.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:cached_network_image/cached_network_image.dart';
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
              options: CarouselOptions(
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlay: true,
                viewportFraction: 0.8,
              ),
              items: snapshot.data!.posts
                  .where((curPost) => curPost.hasImageAvailable)
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: CachedNetworkImage(
                              imageUrl: item.featuredImage,
                              fit: BoxFit.cover,
                              width: 500,
                            )),
                      ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            // TODO: handle carousel if there is no internet connection
            return const Text('No internet connection');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
