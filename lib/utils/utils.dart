import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
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
}
