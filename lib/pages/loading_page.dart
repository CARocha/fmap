import 'package:flutter/material.dart';
import 'package:fmapa/helpers/helpers.dart';
import 'package:fmapa/pages/acceso_gps_page.dart';
import 'package:fmapa/pages/mapa_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver{

  @override
  void initState() {
    
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    
    if (  state == AppLifecycleState.resumed ) {
      if ( await Geolocator.isLocationServiceEnabled()  ) {
        Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, const MapaPage()));
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkGpsYLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if ( snapshot.hasData ) {
            return Center(child: Text(snapshot.data));
          }else {
            return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
          }

        },
      ),
    );
  }

  Future checkGpsYLocation(BuildContext context) async {
    // ignore_for_file: use_build_context_synchronously
     // Si tiene permiso del gps
    final permisoGPS = await Permission.location.isGranted;
    //GPS esta activo
    final gpsActivo = await Geolocator.isLocationServiceEnabled();
   
    if ( permisoGPS && gpsActivo ) {
      Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, const MapaPage()));
      return '';
    } else if ( !permisoGPS ){
      Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, const AccesogpsPage()));
        return 'Es necesario dar acceso al GPS';
    }else if ( !gpsActivo ){
      return 'Active el GPS';
    }
    // await Future.delayed(const Duration(milliseconds: 1000));

    
  }
}
