import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocalizacionCliente {
  StreamController<Position> _posicionController = StreamController<Position>();
  late StreamSubscription<Position> _posicionSubscription;
  late Function _obtenerPosicionClosure;

  LocalizacionCliente() {
    _obtenerPosicionClosure = _iniciarUbicacion;
  }

  // Iniciar el flujo de ubicaciones
  void _iniciarUbicacion() async {
    bool servicioHabilitado;
    LocationPermission permiso;

    // Verificar si el servicio de ubicación está habilitado
    servicioHabilitado = await Geolocator.isLocationServiceEnabled();
    if (!servicioHabilitado) {
      return Future.error('El servicio de ubicación está deshabilitado.');
    }

    // Verificar permisos
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

    // Escuchar actualizaciones de la ubicación
    _posicionSubscription = Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    ).listen((Position posicion) {
      _posicionController.add(posicion); // Emitir la posición actualizada
    });
  }

  // Retorna un closure que se puede usar para iniciar el flujo de posiciones
  Function obtenerUbicacion() {
    return _obtenerPosicionClosure;
  }

  // Detiene la escucha de la ubicación
  void detenerUbicacion() {
    _posicionSubscription.cancel();
    _posicionController.close();
  }

  // Stream para escuchar las actualizaciones de ubicación
  Stream<Position> get posicionesStream => _posicionController.stream;
}