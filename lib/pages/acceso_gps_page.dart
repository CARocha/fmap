import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccesogpsPage extends StatefulWidget {
  const AccesogpsPage({Key? key}) : super(key: key);

  @override
  State<AccesogpsPage> createState() => _AccesogpsPageState();
}

class _AccesogpsPageState extends State<AccesogpsPage>
    with WidgetsBindingObserver {
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
    if (state == AppLifecycleState.resumed) {
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
                final status = await Permission.location.request();
                accesoGPS(status);
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

  void accesoGPS(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        Navigator.pushReplacementNamed(context, 'mapa');
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
