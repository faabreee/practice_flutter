import 'package:flutter/material.dart';
import 'package:flutter_practice/clases/location-cliente.dart';
import 'package:geolocator/geolocator.dart';

class LocationClientView extends StatefulWidget {
  const LocationClientView({super.key});

  @override
  State<LocationClientView> createState() => _LocationClientViewState();
}

class _LocationClientViewState extends State<LocationClientView> {

  LocalizacionCliente localizacionCliente = LocalizacionCliente();
  Position? _posicionActual;

  @override
  void initState() {
    super.initState();

    localizacionCliente.posicionesStream.listen((Position posicion) {
      setState(() {
        _posicionActual = posicion;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location client'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_posicionActual != null)
              Text(
                'Latitud: ${_posicionActual!.latitude}, Longitud: ${_posicionActual!.longitude}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                localizacionCliente.obtenerUbicacion()();
              },
              child: Text('Ubicar'),
            ),
          ],
        ),
      ),
    );
  }
}