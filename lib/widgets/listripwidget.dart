import 'package:flutter/material.dart';
import 'package:gestiones_app/models/alldrivers_model.dart';
import 'package:gestiones_app/models/alltrips_model.dart';
import 'package:gestiones_app/services/coloprovider.dart';
import 'package:gestiones_app/services/usuarios_services.dart';
import 'package:provider/provider.dart';

class ListTripsWidget extends StatelessWidget {
  final AllTripsResponse allTripsModel;
  const ListTripsWidget({
    Key? key,
    required this.allTripsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorProvider>(context).color;
    final usuariosServices = Provider.of<UsuariosService>(context);

    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
      width: usuariosServices.trips.isNotEmpty ? size.width : 0,
      height: usuariosServices.trips.isNotEmpty ? size.height * 0.13 : 0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.call_received_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          SizedBox(
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  allTripsModel.destiny,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  allTripsModel.origin,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: SizedBox(
                  width: 70,
                  height: 20,
                  child: Text(
                    '-${allTripsModel.price}',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  '${allTripsModel.createdAt.day.toString()}/${allTripsModel.createdAt.month.toString()}/${allTripsModel.createdAt.year.toString()}',
                  style: const TextStyle(
                    fontSize: 12,
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

class ListDriversWidget extends StatelessWidget {
  final UsuarioResponse allTripsModel;

  const ListDriversWidget({
    Key? key,
    required this.allTripsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorProvider>(context).color;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
      width: size.width,
      height: size.height * 0.13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 28,
            ),
          ),
          SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  allTripsModel.nombre,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  allTripsModel.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.25,
                child: Text(
                  '-${allTripsModel.uid}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  '${allTripsModel.createdAt.day.toString()}/${allTripsModel.createdAt.month.toString()}/${allTripsModel.createdAt.year.toString()}',
                  style: const TextStyle(
                    fontSize: 12,
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
