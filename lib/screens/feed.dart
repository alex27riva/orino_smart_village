import 'package:flutter/material.dart';
import 'package:orino_smart_village/utils/rest_api.dart';
import 'package:orino_smart_village/models/post_list.dart';
import 'package:orino_smart_village/widgets/feed_item.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with AutomaticKeepAliveClientMixin<Feed> {
  late Future<PostList> futurePost;

  @override
  void initState() {
    futurePost = ApiService.getPosts(perPage: 10);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostList>(
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
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
