import 'package:flutter/material.dart';
import 'package:gestiones_app/models/alldrivers_model.dart';
import 'package:gestiones_app/models/alltrips_model.dart';
import 'package:gestiones_app/services/coloprovider.dart';
import 'package:provider/provider.dart';

class ListTripsWidget extends StatelessWidget {
  final AllTripsModel allTripsModel;
  const ListTripsWidget({
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
              Icons.call_received_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                allTripsModel.destiny,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                allTripsModel.origin,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.25,
                child: Text(
                  '-${allTripsModel.price}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  '${allTripsModel.date.day.toString()}/${allTripsModel.date.month.toString()}/${allTripsModel.date.year.toString()}',
                  style: const TextStyle(
                    fontSize: 15,
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
              Icons.supervised_user_circle,
              color: Colors.white,
              size: 26,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                allTripsModel.nombre,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                allTripsModel.email,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
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
                    fontSize: 20,
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
                    fontSize: 15,
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
