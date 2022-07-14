class Waypoint {
  Waypoint(
      {required this.latitude, required this.longitude, this.name, this.desc});

  final double latitude;
  final double longitude;
  final String? name;
  final String? desc;

  factory Waypoint.fromJson(Map<String, dynamic> data) {
    final name = data['name'] as String?;
    final desc = data['desc'] as String?;
    final latitude = data['latitude'] as double;
    final longitude = data['longitude'] as double;

    return Waypoint(
        name: name, desc: desc, latitude: latitude, longitude: longitude);
  }
}
