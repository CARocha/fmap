import 'package:flutter/material.dart';
import 'package:fmapa/pages/acceso_gps_page.dart';
import 'package:fmapa/pages/loading_page.dart';
import 'package:fmapa/pages/mapa_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const LoadingPage(),
      routes: {
        'mapa': (_) => const MapaPage(),
        'loading': (_) => const LoadingPage(),
        'acceso_gps': (_) => const AccesogpsPage()
      },
    );
  }
}
