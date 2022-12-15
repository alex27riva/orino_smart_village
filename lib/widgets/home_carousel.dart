/*
 * home_carousel.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:orino_smart_village/services/storage_service.dart';
import 'package:orino_smart_village/widgets/network_unavailable.dart';

const int kCarouselItems = 10;
const int kAnimationSeconds = 2;

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Storage storage = Storage();
    return FutureBuilder<ListResult>(
        future: storage.getInstaImages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Reference> images = snapshot.data!.items;
            images.shuffle();
            Iterable<Reference> selectedImages = images.take(kCarouselItems);

            return CarouselSlider(
              options: CarouselOptions(
                autoPlayAnimationDuration:
                    const Duration(seconds: kAnimationSeconds),
                autoPlay: true,
                viewportFraction: 0.8,
              ),
              items:
                  selectedImages.map((item) => getCarouselItem(item)).toList(),
            );
          } else if (snapshot.hasError) {
            return const NetworkUnavailable();
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget getCarouselItem(Reference ref) {
    return FutureBuilder(
      future: ref.getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  imageUrl: snapshot.data.toString(),
                  fit: BoxFit.cover,
                  width: 500,
                )),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }
}
