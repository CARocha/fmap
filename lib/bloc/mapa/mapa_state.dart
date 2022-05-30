part of 'mapa_bloc.dart';

@immutable
class MapaState {
  final bool mapaListo;

  const MapaState({this.mapaListo = false});

  MapaState copyWith({
    required bool mapaListo
  }) => MapaState(
    mapaListo: mapaListo
  );

}
