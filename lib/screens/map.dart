import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orino_smart_village/models/waypoint.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin<MapPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.8876175, 8.7261915);

  late Future _future;

  Future<String> loadString() async =>
      await rootBundle.loadString('assets/percorso1.json');
  List<Marker> allMarkers = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _future = loadString();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              List<dynamic> parsedJson = jsonDecode(snapshot.data);
              allMarkers = parsedJson.map((element) {
                Waypoint currentWaypoint = Waypoint.fromJson(element);
                return Marker(
                  infoWindow: InfoWindow(
                    title: currentWaypoint.name,
                    snippet: currentWaypoint.desc
                  ),
                    markerId: MarkerId(random.nextInt(100).toString()),
                    position:
                        LatLng(currentWaypoint.latitude, currentWaypoint.longitude));
              }).toList();

              return GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                mapType: MapType.terrain,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: Set.from(allMarkers),
                onMapCreated: _onMapCreated,
              );
            },
          ),
        ),
      ]),
    );
  }
}
