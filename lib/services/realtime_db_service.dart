/*
 * realtime_db_service.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference locations =
  FirebaseDatabase.instance.ref('location');

  Future<Iterable<DataSnapshot>?> getLocations() async {
    final snapshot = await locations.get();
    if (snapshot.exists) {
      return snapshot.children;
      print(snapshot.value);
    } else {
      print('No data available.');
      return null;

    }

  }

}
