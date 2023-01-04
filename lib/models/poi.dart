/*
 * poi.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:firebase_database/firebase_database.dart';

class POI {
  POI(
      {required this.latitude,
      required this.longitude,
      required this.name,
      this.desc});

  final double latitude;
  final double longitude;
  final String name;
  final String? desc;

  factory POI.fromJson(Map<String, dynamic> data) {
    final name = data['name'] as String;
    final desc = data['desc'] as String?;
    final latitude = data['latitude'] as double;
    final longitude = data['longitude'] as double;

    return POI(
        name: name, desc: desc, latitude: latitude, longitude: longitude);
  }

  factory POI.fromDataSnapshot(DataSnapshot data) {
    Map<dynamic, dynamic>? values = data.value as Map?;
    final name = values!['name'] as String;
    final desc = values['description'] as String?;
    final latitude = values['latitude'] as double;
    final longitude = values['longitude'] as double;

    return POI(
        name: name, desc: desc, latitude: latitude, longitude: longitude);
  }
}
