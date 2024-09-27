import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocalizacionCliente {
  StreamController<Position> _posicionController = StreamController<Position>();
  late StreamSubscription<Position> _posicionSubscription;
  late Function _obtenerPosicionClosure;

  LocalizacionCliente() {
    _obtenerPosicionClosure = _iniciarUbicacion;
  }

  void _iniciarUbicacion() async {
    bool servicioHabilitado;
    LocationPermission permiso;

    servicioHabilitado = await Geolocator.isLocationServiceEnabled();
    if (!servicioHabilitado) {
      return Future.error('El servicio de ubicación está deshabilitado.');
    }

    permiso = await Geolocator.checkPermission();
    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
      if (permiso == LocationPermission.denied) {
        return Future.error('Permiso de ubicación denegado');
      }
    }

    if (permiso == LocationPermission.deniedForever) {
      return Future.error(
          'Permiso de ubicación denegado permanentemente. No se pueden solicitar permisos.');
    }

    _posicionSubscription = Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    ).listen((Position posicion) {
      _posicionController.add(posicion);
    });
  }

  Function obtenerUbicacion() {
    return _obtenerPosicionClosure;
  }

  void detenerUbicacion() {
    _posicionSubscription.cancel();
    _posicionController.close();
  }

  Stream<Position> get posicionesStream => _posicionController.stream;
}