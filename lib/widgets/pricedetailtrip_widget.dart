import 'package:flutter/material.dart';
import 'package:gestiones_app/models/alltrips_model.dart';

class PriceDetailTrip extends StatelessWidget {
  const PriceDetailTrip({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final AllTripsResponse trip;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Text(
        'L.${trip.price}',
        style: const TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
