import 'package:flutter/cupertino.dart';
import 'package:gestiones_app/global/environment.dart';
import 'package:gestiones_app/models/alldrivers_model.dart';
import 'package:gestiones_app/models/alltrips_model.dart';
import 'package:gestiones_app/models/trips_model.dart';
import 'package:gestiones_app/models/usuarios_model.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:http/http.dart' as http;

class UsuariosService with ChangeNotifier {
  List<UsuarioResponse> users = [];
  List<AllTripsResponse> trips = [];
  UsuariosService() {
    getTrips();
  }
  getUsuarios() async {
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/usuarios'),
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthServices.getToken(),
      },
    );
    final usuariosResponse = usuariosModelFromJson(resp.body);
    users = usuariosResponse.usuarios;
    notifyListeners();
  }

  getTrips() async {
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/tripsH'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final tripsResponse = tripsModelFromJson(resp.body);
    trips = tripsResponse.tripsH;
    notifyListeners();
  }
}
