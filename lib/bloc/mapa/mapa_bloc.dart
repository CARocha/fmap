import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {
  MapaBloc() : super(const MapaState()) {
    on<OnMapaListo>((event, emit) {
      emit(
        state.copyWith(mapaListo: true)
      );
    });
  }

  late GoogleMapController _mapController;
  
  void initMapa(GoogleMapController controller){
    if ( !state.mapaListo ){
      _mapController = controller;
      //TODO: tema del mapa
      add(OnMapaListo());
    }
  }
}
