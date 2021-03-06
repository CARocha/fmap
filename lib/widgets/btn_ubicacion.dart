
part of 'widgets.dart';

class BtnUbicacion extends StatelessWidget {
  const BtnUbicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapaBloc>(context);
    final locationBloc = BlocProvider.of<MiUbicacionBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(Icons.my_location, color: Colors.black87,),
          onPressed: (){
            final destino = locationBloc.state.ubicacion;
            mapBloc.moverCamara(destino!);
          },
        ),
      ),
    );
  }
}