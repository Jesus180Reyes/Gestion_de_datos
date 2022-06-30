import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestiones_app/models/alltrips_model.dart';
import 'package:gestiones_app/widgets/pricedetailtrip_widget.dart';
import 'package:gestiones_app/widgets/tripsdetails_widget.dart';

class TripsDetailsPage extends StatelessWidget {
  const TripsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trip = ModalRoute.of(context)!.settings.arguments as AllTripsResponse;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () async {},
            icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
          ),
        ],
        foregroundColor: Colors.black,
        title: const Text(
          'Detalles del viaje',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DetailsTripColumn(trip: trip),
            const SizedBox(height: 20),
            DetailsTripDate(size: size, trip: trip),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 5),
              width: size.width,
              child: const Text(
                'Precio de Viaje',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PriceDetailTrip(trip: trip),
          ],
        ),
      ),
    );
  }
}
