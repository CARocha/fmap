import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';

class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
  StreamSubscription<Position>? _subscription;
  MiUbicacionBloc() : super(const MiUbicacionState()) {
    on<OnUbicacionCambio>((event, emit) {
      //print(event);
      emit( state.copyWith(
        existeUbicacion: true,
        ubicacion: event.ubicacion
      ));
    });
  }

  void iniciarSeguimiento() {
    // ignore: prefer_const_constructors
    final geoLocatorOptions =
        // ignore: prefer_const_constructors
        LocationSettings(accuracy: LocationAccuracy.best, distanceFilter: 10);
    _subscription =
        Geolocator.getPositionStream(locationSettings: geoLocatorOptions)
            .listen((position) {
            //print(position);
            final newUbicacion = new LatLng(position.latitude, position.longitude);
            add(OnUbicacionCambio(newUbicacion));
    });
  }

  void cancelarSeguimiento() {
    _subscription?.cancel();
  }
}
