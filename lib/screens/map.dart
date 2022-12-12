/*
 * map.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:orino_smart_village/services/realtime_db_service.dart';

const LatLng _center = LatLng(45.8876175, 8.7261915);

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late Future<Iterable<DataSnapshot>> locFuture;
  late RealtimeDatabase rtdb = RealtimeDatabase();

  static const CameraPosition centerPosition =
      CameraPosition(target: _center, zoom: 14.0);

  List<Marker> allMarkers = [];

  // Method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    locFuture = rtdb.getLocations();
    _goToCenter();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<Iterable<DataSnapshot>>(
          future: locFuture,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            snapshot.data!.forEach((child) {
              var childVal = child.value;

              allMarkers.add(Marker(
                  infoWindow: InfoWindow(
                      title: childVal['name'], snippet: childVal['desc']),
                  markerId: MarkerId(childVal['name']),
                  position:
                      LatLng(childVal['latitude'], childVal['longitude'])));
            });

            return GoogleMap(
              // Use FloatingActionButton
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              mapToolbarEnabled: false,
              mapType: MapType.terrain,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: Set.from(allMarkers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          },
        ),
      ),
      // Current location button
      Positioned(
        bottom: 35,
        left: 10,
        child: FloatingActionButton(
          child: const Icon(Icons.my_location_outlined),
          onPressed: () async {
            getUserCurrentLocation().then((value) async {
              _goToPosition(value.latitude, value.longitude);
            });
          },
        ),
      ),
    ]);
  }

  Future<void> _goToCenter() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(centerPosition));
  }

  Future<void> _goToPosition(double lat, double lon) async {
    LatLng pos = LatLng(lat, lon);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: pos, zoom: 14.0)));
  }
}
