import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html_unescape/html_unescape.dart';

class Utils {
  static var htmlUnescape = HtmlUnescape();

  static String unescape(escapedString) {
    return htmlUnescape.convert(escapedString);
  }

  static void openUri(uri) {
    launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static void openUrl(url) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  static Future<File> getFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  static String stripHtmlTags(String html) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String parsedString = html.replaceAll(exp, '').replaceAll('[&hellip;]', '');
    parsedString = unescape(parsedString);
    return parsedString;
  }
}
