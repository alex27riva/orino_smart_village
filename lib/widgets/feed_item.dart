import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:orino_smart_village/models/post.dart';
import 'package:orino_smart_village/utils/utils.dart';

const Color cardColor = Color(0x00F5DFBB);

class FeedItem extends StatelessWidget {
  final Post post;

  const FeedItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Utils.openUri(post.link);
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        elevation: 50,
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
              Text(post.title,
                  style: const TextStyle(
                    fontSize: 30,
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
                child: SizedBox(height: 200, child: Html(data: post.content)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
