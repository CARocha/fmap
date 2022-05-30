import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccesogpsPage extends StatefulWidget {
  const AccesogpsPage({Key? key}) : super(key: key);

  @override
  State<AccesogpsPage> createState() => _AccesogpsPageState();
}

class _AccesogpsPageState extends State<AccesogpsPage>
    with WidgetsBindingObserver {

  bool popUp = false;

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
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if ( state == AppLifecycleState.resumed && !popUp ) {
      if (await Permission.location.isGranted) {
        Navigator.pushReplacementNamed(context, 'loading');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const varStyle = TextStyle(color: Colors.white);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Es necesario permiso del GPS para usar esta app"),
            MaterialButton(
              onPressed: () async {
                popUp = true;
                final status = await Permission.location.request();
                await accesoGPS(status);
                popUp = false;
              },
              color: Colors.black,
              shape: const StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              child: const Text("Solicitar acceso", style: varStyle),
            )
          ],
        ),
      ),
    );
  }

  Future accesoGPS(PermissionStatus status) async {
    switch (status) {
      case PermissionStatus.granted:
        await Navigator.pushReplacementNamed(context, 'loading');
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
        break;
      case PermissionStatus.limited:
        break;
    }
  }
}
