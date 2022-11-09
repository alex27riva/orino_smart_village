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

const Color cardColor = Color.fromRGBO(202, 240, 248, 0.7);

class FeedItem extends StatelessWidget {
  final Post post;

  const FeedItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewPage(
                  url: post.link.toString(),
                  title: Utils.unescape(post.title),
                )));
      },
      child: Card(
        margin: const EdgeInsets.all(10.0),
        elevation: 10,
        color: cardColor,
        shape: const RoundedRectangleBorder(
            side: BorderSide(
          width: 1,
          color: Colors.black,
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Utils.unescape(post.title),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
              Container(
                child: (post.hasImageAvailable)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          post.featuredImage,
                          width: 200,
                          height: 150,
                        ),
                      )
                    : Container(), // empty container
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: SizedBox(
                    height: 150,
                    child: Text(Utils.stripHtmlTags(post.excerpt),
                        softWrap: true, maxLines: 8),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
