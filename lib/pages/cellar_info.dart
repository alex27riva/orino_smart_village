/*
 * cellar_info.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:orino_smart_village/pages/webview.dart';

class CellarInfo extends StatelessWidget {
  final String title;
  final String imagePath;
  final String content;
  final String externalUrl;

  const CellarInfo(
      {Key? key,
      required this.title,
      required this.content,
      required this.imagePath,
      required this.externalUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(image: AssetImage(imagePath))),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              content,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WebViewPage(
                    url: externalUrl,
                    title: title,
                  )));
        },
        icon: const Icon(Icons.read_more),
        label: Text(AppLocalizations.of(context)!.moreInfoText),
      ),
    );
  }
}
