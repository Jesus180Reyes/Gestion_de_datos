import 'package:flutter/material.dart';
import 'package:gestiones_app/helpers/helpers.dart';
import 'package:gestiones_app/models/alltrips_model.dart';
import 'package:gestiones_app/pages/nodata_page.dart';
import 'package:gestiones_app/services/usuarios_services.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    final tripsServices = Provider.of<UsuariosService>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff2EB7B7),
        centerTitle: true,
        title: const Text('Viajes'),
      ),
      body: SmartRefresher(
        onRefresh: () async {
          await tripsServices.getTrips();
          _refreshController.refreshCompleted();
        },
        controller: _refreshController,
        enablePullDown: true,
        header: const WaterDropHeader(
          waterDropColor: Color(0xff2EB7B7),
          complete: Icon(Icons.check, color: Colors.blue),
        ),
        child: (tripsServices.trips.isNotEmpty)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ...tripsServices.trips.reversed
                        .map(
                          (e) => _Trips(
                            trips: e,
                          ),
                        )
                        .toList()
                  ],
                ),
              )
            : const NoDataPage(),
      ),
    );
  }
}

class _Trips extends StatelessWidget {
  const _Trips({
    Key? key,
    required this.trips,
    this.index = 1,
  }) : super(key: key);

  final AllTripsResponse trips;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Navigator.pushNamed(context, 'tripsD', arguments: trips),
          trailing: Text(trips.realeaseBy),
          subtitle: Text(trips.origin),
          title: Text(trips.destiny),
          leading: CircleAvatar(
            backgroundColor: Colors.indigo,
            child: Text(
                '${trips.destiny.substring(0, 1)}${trips.origin.substring(0, 1)}'),
          ),
        ),
      ],
    );
  }
}
