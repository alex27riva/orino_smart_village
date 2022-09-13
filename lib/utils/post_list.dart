import 'package:orino_smart_village/utils/post.dart';

class PostList {
  late final List<Post> posts;

  PostList({
    required this.posts,
  });

  getFirst() {
    return posts.first;
  }

  len() {
    return posts.length;
  }

  factory PostList.fromJson(List<dynamic> json) {
    List<Post> posts = <Post>[];
    posts = json.map((i) => Post.fromJson(i)).toList();
    return PostList(posts: posts);
  }
}