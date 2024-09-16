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
  String _coordenadas = "";

  static const CameraPosition _inicialPosicion = CameraPosition(
    target: LatLng(-11.9757, -77.0606),
    zoom: 14.4746,
  );

  static const CameraPosition _camaraPosicion = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-11.9757, -77.0606),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  void initState() {
    super.initState();
    _getPermiso();
  }

  Future<void> _getPermiso() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      _getCoordenadas();
    } else {
      print('Permiso denegafo');
    }
  }

  Future<void> _getCoordenadas() async {
    final position = await Geolocator.getCurrentPosition();
    print('Coordenadas: ${position.latitude}, ${position.longitude}');
  }

  Future<void> _iraPosicion() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_camaraPosicion));
  }
  
  void _tocarMapa(LatLng position) {
    setState(() {
      _coordenadas = 'Coordenadas: ${position.latitude}, ${position.longitude}';
    });
    print(_coordenadas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: _inicialPosicion,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: _tocarMapa,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _iraPosicion,
              backgroundColor: Colors.blue,
              child: const Icon(Icons.send_rounded),
            ),
            const SizedBox(height: 16),
            Text(
                _coordenadas,
                style: TextStyle(color: Colors.amber, fontSize: 16, backgroundColor: Colors.black.withOpacity(0.6)),
            ),
          ],
        ),
      ),
    );
  }
}
