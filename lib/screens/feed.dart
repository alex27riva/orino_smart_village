/*
 * feed.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/constants/urls.dart';
import 'package:orino_smart_village/utils/rest_api.dart';
import 'package:orino_smart_village/models/post_list.dart';
import 'package:orino_smart_village/widgets/feed_item.dart';
import 'package:orino_smart_village/widgets/network_unavailable.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with AutomaticKeepAliveClientMixin<Feed> {
  late Future<PostList> futurePost;
  ApiService api = ApiService(URLS.baseApiUrl);

  Future<PostList> fetchPostList() => api.getPosts(perPage: 10);

  @override
  void initState() {
    futurePost = fetchPostList();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          futurePost = fetchPostList();
        });
      },
      child: FutureBuilder<PostList>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(20.0),
                  itemCount: snapshot.data!.posts.length,
                  itemBuilder: (context, index) {
                    return FeedItem(
                      post: snapshot.data!.posts[index],
                    );
                  });
            } else if (snapshot.hasError) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                child: const NetworkUnavailable(),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
