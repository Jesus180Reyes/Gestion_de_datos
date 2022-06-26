import 'package:flutter/material.dart';
import 'package:gestiones_app/models/alltrips_model.dart';

class DetailsTripColumn extends StatelessWidget {
  final AllTripsResponse trip;
  const DetailsTripColumn({
    Key? key,
    required this.trip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 10, top: 30, bottom: 20),
          child: const Text(
            'Detalles del viaje',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
          height: size.height * 0.2,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Text(trip.realeaseBy.substring(0, 2)),
              ),
              const SizedBox(width: 10),
              Text(
                trip.realeaseBy,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 100,
                child: Text(
                  '#${trip.uid}',
                  style: const TextStyle(
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DetailsTripDate extends StatelessWidget {
  const DetailsTripDate({
    Key? key,
    required this.size,
    required this.trip,
  }) : super(key: key);

  final Size size;
  final AllTripsResponse trip;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    trip.origin,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    trip.origin.substring(0, 3),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_right_rounded,
                size: 60,
                color: Colors.green,
              ),
              Column(
                children: [
                  Text(
                    trip.destiny,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    trip.destiny.substring(0, 3),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(right: 20, top: 10),
              child: Row(
                children: [
                  CustomBox(
                    trip:
                        '${trip.createdAt.day.toString()}/${trip.createdAt.month.toString()}/${trip.createdAt.year.toString()}',
                    text: 'Fecha de Reporte',
                  ),
                  CustomBox(
                      trip: trip.hourAt.toString(), text: 'Hora de Ingreso'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final String text;
  const CustomBox({
    Key? key,
    required this.trip,
    required this.text,
  }) : super(key: key);

  final String trip;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(15),
      // height: 100,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.blueGrey,
          width: 1,
        ),
      ),
      child: Boxinput(
        text: text,
        trip: trip,
      ),
    );
  }
}

class Boxinput extends StatelessWidget {
  const Boxinput({
    Key? key,
    required this.text,
    required this.trip,
  }) : super(key: key);

  final String text;
  final String trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          trip,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
