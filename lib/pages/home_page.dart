import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gestiones_app/helpers/helpers.dart';
import 'package:gestiones_app/helpers/mostrar_alerta.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:gestiones_app/services/socketservices.dart';
import 'package:gestiones_app/services/usuarios_services.dart';
import 'package:gestiones_app/ui/boxicon.dart';
import 'package:gestiones_app/widgets/headerlabel.dart';
import 'package:gestiones_app/widgets/listripwidget.dart';
import 'package:gestiones_app/widgets/login/customwelcome_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    cambiarColorStatus();
    cambiarStatusLight();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tripDialog(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xff2EB7B7),
      ),
      backgroundColor: const Color(0xff2EB7B7),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              CustomWelcomeWidgets(
                size: size,
                usuarioResponse: authService.usuarioResponse!,
              ),
              _CustomColumn(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomColumn extends StatefulWidget {
  const _CustomColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<_CustomColumn> createState() => _CustomColumnState();
}

class _CustomColumnState extends State<_CustomColumn> {
  @override
  void initState() {
    final usuariosServices =
        Provider.of<UsuariosService>(context, listen: false);
    usuariosServices.getUsuarios();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    final socketServices = Provider.of<SocketService>(context);
    final usuariosServices = Provider.of<UsuariosService>(context);
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxIcon(
                onPressed: () => {
                  socketServices.disconnect(),
                  authServices.logOut(),
                  Navigator.pushReplacementNamed(context, 'login'),
                },
                icon: Icons.logout,
                title: 'Cerrar Sesion',
                color: Colors.purple,
              ),
              BoxIcon(
                onPressed: () {
                  usuariosServices.getUsuarios();
                  Navigator.pushNamed(context, 'usersOnline');
                },
                icon: Icons.person,
                title: 'Usuarios',
                color: Colors.indigo,
              ),
              BoxIcon(
                onPressed: () {
                  Navigator.pushNamed(context, 'tripsH');
                },
                icon: Icons.history,
                title: 'Viajes',
                color: Colors.green,
              ),
            ],
          ),
          SizedBox(height: usuariosServices.trips.isNotEmpty ? 60 : 0),
          (usuariosServices.trips.isNotEmpty)
              ? const HeaderLabel(
                  subtitle: 'Ver Todos',
                  title: 'Ultimos Viajes',
                  route: 'tripsH',
                )
              : const SizedBox(),
          const SizedBox(height: 20),
          SizedBox(
            height: usuariosServices.trips.isNotEmpty
                ? widget.size.height * 0.4
                : 0,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: usuariosServices.trips.reversed.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) => ListTripsWidget(
                allTripsModel: usuariosServices.trips[index],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const HeaderLabel(
            title: 'Total Usuarios',
            subtitle: 'Ver Todos',
            route: 'usersOnline',
          ),
          SizedBox(
            height: widget.size.height * 0.4,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: usuariosServices.users.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  ListDriversWidget(
                allTripsModel: usuariosServices.users[index],
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
