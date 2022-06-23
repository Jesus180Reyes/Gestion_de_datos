import 'package:flutter/material.dart';
import 'package:gestiones_app/models/alltrips_model.dart';

class TripsDetailsPage extends StatelessWidget {
  const TripsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trip = ModalRoute.of(context)!.settings.arguments as AllTripsResponse;
    return Scaffold(
      body: Center(
        child: Text(trip.destiny),
      ),
    );
  }
}
