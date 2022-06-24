import 'package:flutter/material.dart';
import 'package:gestiones_app/models/alldrivers_model.dart';
import 'package:gestiones_app/pages/nodata_page.dart';
import 'package:gestiones_app/services/usuarios_services.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosOnlinePage extends StatefulWidget {
  const UsuariosOnlinePage({Key? key}) : super(key: key);

  @override
  State<UsuariosOnlinePage> createState() => _UsuariosOnlinePageState();
}

RefreshController _refreshController = RefreshController(initialRefresh: false);

class _UsuariosOnlinePageState extends State<UsuariosOnlinePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsuariosService>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff2EB7B7),
        centerTitle: true,
        title: const Text('Usuarios conectados'),
      ),
      body: SmartRefresher(
        onRefresh: () async {
          await user.getUsuarios();
          _refreshController.refreshCompleted();
        },
        controller: _refreshController,
        enablePullDown: true,
        header: const WaterDropHeader(
          waterDropColor: Color(0xff2EB7B7),
          complete: Icon(Icons.check, color: Colors.blue),
        ),
        child: (user.users.isNotEmpty)
            ? ListView.builder(
                itemCount: user.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return _Users(usuarios: user.users[index]);
                },
              )
            : const NoDataPage(
                lottiUrl: 'assets/users-and-vr-loop.json',
                repeat: true,
              ),
      ),
    );
  }
}

class _Users extends StatelessWidget {
  const _Users({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  final UsuarioResponse usuarios;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: Icon(
            Icons.circle,
            size: 20,
            color: usuarios.online != true ? Colors.red : Colors.green,
          ),
          subtitle: Text(usuarios.email),
          title: Text('${usuarios.nombre} ${usuarios.apellido}'),
          leading: CircleAvatar(
            backgroundColor: Colors.indigo,
            child: Text('${usuarios.nombre.substring(0, 1)}'
                '${usuarios.apellido.substring(0, 1)}'),
          ),
        ),
        Divider(
          color: Colors.grey[200],
          thickness: 2,
        ),
      ],
    );
  }
}
