import 'package:flutter/material.dart';
import 'package:fmapa/helpers/helpers.dart';
import 'package:fmapa/pages/mapa_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkGpsYLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        },
      ),
    );
  }

  Future checkGpsYLocation(BuildContext context) async {
    //TODO: Permiso GPS
    //TODO: GPS esta activo

    await Future.delayed(const Duration(milliseconds: 1000));

    // ignore_for_file: use_build_context_synchronously
    Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, const MapaPage()));
  }
}
