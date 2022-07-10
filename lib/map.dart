import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.8876175, 8.7261915);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          myLocationButtonEnabled: true,
          mapType: MapType.terrain,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: {Marker(position: _center, markerId: const MarkerId('centro'),)},
        ),
    );
  }
}
