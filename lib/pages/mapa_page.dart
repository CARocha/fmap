import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmapa/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  @override
  void initState() {
    BlocProvider.of<MiUbicacionBloc>(context).iniciarSeguimiento();

    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<MiUbicacionBloc>(context).cancelarSeguimiento();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MiUbicacionBloc, MiUbicacionState>(
        builder: ( _ , state) => crearMapa(state),
      ),
    );
  }

  Widget crearMapa( MiUbicacionState state){
    if ( !state.existeUbicacion ) return const Center(child: Text("Ubicando..."));

    final camaraPosicion = CameraPosition(
      target: LatLng(state.ubicacion!.latitude, state.ubicacion!.longitude),
      zoom: 16
      );
    return GoogleMap(
      initialCameraPosition: camaraPosicion,
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false);
    //return Center(child: Text("Mi Latitud ${state.ubicacion?.latitude} y Longitud ${state.ubicacion?.longitude}"));
  }
}
