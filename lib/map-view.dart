import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  String _coordinates = "Click on the map";

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-11.989210191376824,-77.06470494263792),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-11.990609737563338, -77.066976020058),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      _getCurrentLocation();
    } else {
      print('Location permission denied.');
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      
      // Optionally move the camera to the current location
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude),
        ),
      );
    } catch (e) {
      print('Error getting location: $e');
    }
  }
  
  void _onMapTapped(LatLng position) {
    setState(() {
      _coordinates = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    });
    print(_coordinates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: _onMapTapped,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _goToTheLake,
            child: const Icon(Icons.directions_boat),
            backgroundColor: Colors.blue,
          ),
          Container(
            child: Text(
              _coordinates,
              style: TextStyle(color: Colors.amber, backgroundColor: Colors.black, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
