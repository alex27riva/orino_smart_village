/*
 * webview.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:orino_smart_village/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;
  final bool loadingIndicator;

  const WebViewPage(
      {Key? key,
      this.url = '',
      this.title = 'Browser',
      this.loadingIndicator = false})
      : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool _isLoadingPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text(AppLocalizations.of(context)!.openExternalBrowser),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 0) {
              Utils.openUrl(widget.url);
            }
          },
        ),
      ]),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onWebViewCreated: (InAppWebViewController controller) {},
            onLoadStart: (controller, url) async {
              setState(() {
                _isLoadingPage = true;
              });
            },
            onLoadStop: (controller, url) {
              setState(() {
                _isLoadingPage = false;
              });
            },
          ),
          if (widget.loadingIndicator && _isLoadingPage)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
