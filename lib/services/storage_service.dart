/*
 * storage_service.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:orino_smart_village/constants/misc.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<ListResult> listFiles(String folder) async {
    ListResult results = await storage.ref(folder).listAll();
    for (var ref in results.items) {
      if (kDebugMode) {
        print("Found file $ref");
      }
    }
    return results;
  }

  Future<ListResult> getInstaImages() async {
    final Reference ref = storage.ref().child(MiscCostants.instaImagesFolder);
    ListResult result = await ref.listAll();
    return result;
  }

  Future<String> downloadURL(
      {required String path, required String imageName}) async {
    String downloadURL = await storage.ref('$path/$imageName').getDownloadURL();

    return downloadURL;
  }
}
