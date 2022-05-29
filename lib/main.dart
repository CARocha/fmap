import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmapa/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:fmapa/pages/acceso_gps_page.dart';
import 'package:fmapa/pages/loading_page.dart';
import 'package:fmapa/pages/mapa_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MiUbicacionBloc()),
      ],
      child: MaterialApp(
        title: 'Material App',
        // home: const LoadingPage(),
        home: const AccesogpsPage(),
        routes: {
          'mapa': (_) => const MapaPage(),
          'loading': (_) => const LoadingPage(),
          'acceso_gps': (_) => const AccesogpsPage()
        },
      ),
    );
  }
}
