import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedItem extends StatelessWidget {
  final Color cardColor = const Color(0x00F5DFBB);
  final String title;
  final String image;
  final String content;
  final Uri link;

  const FeedItem({Key? key,
    required this.title,
    required this.image,
    required this.content,
    required this.link})
      : super(key: key);

  void openUri(uri) {
    launchUrl(uri, mode: LaunchMode.externalApplication);
  }

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: () {
          openUri(link);
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
                Text(title,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: SizedBox(height: 200, child: Html(data: content)),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
