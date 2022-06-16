import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gestiones_app/data/alldrivers.dart';
import 'package:gestiones_app/data/alltrips.dart';
import 'package:gestiones_app/helpers/helpers.dart';
import 'package:gestiones_app/ui/boxicon.dart';
import 'package:gestiones_app/widgets/headerlabel.dart';
import 'package:gestiones_app/widgets/listripwidget.dart';
import 'package:gestiones_app/widgets/login/customwelcome_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarColorStatus();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff2EB7B7),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              CustomWelcomeWidgets(size: size),
              _CustomColumn(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomColumn extends StatelessWidget {
  const _CustomColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      // height: size.height,
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
            children: const [
              BoxIcon(
                icon: Icons.person,
                title: 'Conductores',
                color: Colors.purple,
              ),
              BoxIcon(
                icon: Icons.monetization_on,
                title: 'Conductores',
                color: Colors.indigo,
              ),
              BoxIcon(
                icon: Icons.history,
                title: 'Historial',
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 60),
          const HeaderLabel(
            subtitle: 'Ver Todos',
            title: 'Ultimos Viajes',
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => ListTripsWidget(
                allTripsModel: allTrips[index],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const HeaderLabel(title: 'Total Conductores', subtitle: 'Ver Todos'),
          SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  ListDriversWidget(
                allTripsModel: allDrivers[index],
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
