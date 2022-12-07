/*
 * storage_service.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

const String panoramicImagesFolder = 'orino-360';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results =
        await storage.ref(panoramicImagesFolder).listAll();
    results.items.forEach((firebase_storage.Reference ref) {
      print("Found file $ref");
    });
    return results;
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('$panoramicImagesFolder/$imageName').getDownloadURL();

    return downloadURL;
  }
}
