import 'package:flutter/material.dart';
import 'package:gestiones_app/models/alldrivers_model.dart';
import 'package:gestiones_app/services/socketservices.dart';
import 'package:provider/provider.dart';

class CustomWelcomeWidgets extends StatelessWidget {
  final UsuarioResponse usuarioResponse;
  const CustomWelcomeWidgets({
    Key? key,
    required this.size,
    required this.usuarioResponse,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final socketServices = Provider.of<SocketService>(context);
    return Container(
      height: size.height * 0.22,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: size.width * 0.6,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello ${usuarioResponse.nombre}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[200],
                  ),
                ),
                Text(
                  'Welcome to your dashboard',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                // color: Colors.green,
                padding: const EdgeInsets.only(right: 25, bottom: 10, top: 17),
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.indigo,
                  child: Text(
                    '${usuarioResponse.nombre.substring(0, 1)}${usuarioResponse.apellido.substring(0, 1)}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 10,
                left: -5,
                child: Container(
                  height: 20,
                  width: 25,
                  decoration: BoxDecoration(
                    color: socketServices.serverStatus == ServerStatus.online
                        ? Colors.green[500]
                        : Colors.red[500],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
