class Post {
  final int id;
  final String title;
  final dynamic featuredMediaUrl;

  const Post({
    required this.id,
    required this.title,
    required this.featuredMediaUrl,

  });

  getMediaUrl() {
    return featuredMediaUrl;
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title']['rendered'] as String,
      featuredMediaUrl: json['featured_media_url'] as dynamic,
    );
  }
}
