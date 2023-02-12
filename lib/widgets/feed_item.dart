/*
 * feed_item.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/models/post.dart';
import 'package:orino_smart_village/pages/webview.dart';
import 'package:orino_smart_village/utils/utils.dart';

Color cardColor = Colors.white;
const int postTitleMaxLen = 20;
const int postContentMaxLen = 150;

class FeedItem extends StatelessWidget {
  final Post post;

  const FeedItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              url: post.link.toString(),
              title: Utils.unescape(post.title),
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0),
        elevation: 2,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        // Card title
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card image
            SizedBox(
              width: double.infinity,
              child: (post.hasImageAvailable)
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      post.featuredImage,
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  )
                  : Container(), // empty container
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 24.0,
                right: 24.0,
              ),
              child: Text(
                Utils.shortText(
                  Utils.unescape(post.title),
                  maxLength: postTitleMaxLen,
                ),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            // Card content
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 16.0,
                left: 24.0,
                right: 24.0,
              ),
              child: Text(
                Utils.shortText(Utils.stripHtmlTags(post.excerpt),
                    maxLength: postContentMaxLen),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                maxLines: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
