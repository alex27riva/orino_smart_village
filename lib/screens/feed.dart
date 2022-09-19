import 'package:flutter/material.dart';

import '../rest_api.dart';
import '../utils/post_list.dart';
import '../widgets/feed_item.dart';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late Future<PostList> futurePost;

  @override
  void initState() {
    futurePost = ApiService.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<PostList>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: const EdgeInsets.all(20.0),
                    itemCount: snapshot.data!.posts.length,
                    itemBuilder: (context, index) {
                      return FeedItem(
                        title: snapshot.data!.posts[index].title,
                        content: snapshot.data!.posts[index].content,
                        image: snapshot.data!.posts[index].featuredImage,
                        link: snapshot.data!.posts[index].link,
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }));
  }
}
