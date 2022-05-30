part of 'mapa_bloc.dart';

@immutable
class MapaState {
  final bool mapaListo;
  final bool dibujarRecorrido;
  // polylines
  final Map<String, Polyline> polylines;

  MapaState(
      {this.mapaListo = false,
      this.dibujarRecorrido = true,
      Map<String, Polyline>? polylines})
      : polylines = polylines ?? {};

  MapaState copyWith(
          {required bool mapaListo, required bool dibujarRecorrido}) =>
      MapaState(
          mapaListo: mapaListo,
          dibujarRecorrido: dibujarRecorrido,
          polylines: polylines);
}
