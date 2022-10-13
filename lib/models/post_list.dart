import 'package:orino_smart_village/models/post.dart';

class PostList {
  late final List<Post> posts;

  PostList({
    required this.posts,
  });

  factory PostList.fromJson(List<dynamic> json) {
    List<Post> posts = <Post>[];
    posts = json.map((i) => Post.fromJson(i)).toList();
    return PostList(posts: posts);
  }
}
