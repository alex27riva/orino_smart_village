class Post {
  final int id;
  final String title;
  final String content;
  final String featuredImage;
  final bool hasImageAvailable;
  final Uri link;

  Post(
      {required this.id,
      required this.title,
      required this.link,
      required this.content,
      required this.featuredImage,
      required this.hasImageAvailable});

  factory Post.fromJson(Map<String, dynamic> json) {
    bool hasImage = json['featured_media'] != 0 ? true : false;
    return Post(
      id: json['id'] as int,
      title: json['title']['rendered'] as String,
      link: Uri.parse(json['link']),
      content: json['content']['rendered'],
      featuredImage: hasImage ? json['featured_media_url'] : "",
      hasImageAvailable: hasImage,
    );
  }
}
