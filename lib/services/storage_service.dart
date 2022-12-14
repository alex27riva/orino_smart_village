/*
 * storage_service.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<firebase_storage.ListResult> listFiles(String folder) async {
    firebase_storage.ListResult results = await storage.ref(folder).listAll();
    for (var ref in results.items) {
      if (kDebugMode) {
        print("Found file $ref");
      }
    }
    return results;
  }

  Future<String> downloadURL({required String path, required String imageName}) async {
    String downloadURL = await storage.ref('$path/$imageName').getDownloadURL();

    return downloadURL;
  }
}
