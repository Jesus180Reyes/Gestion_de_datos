import 'dart:convert';

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

  Future sendMessage(
      {required String name,
      required String message,
      required String origin,
      required String destiny,
      required String price,
      required String product}) async {
    String serviceId = 'service_amjvdra';
    String templateId = 'template_ynb6n1f';
    String userId = '4CTVl1XhPUCYxIoF4';

    final resp = await http.post(
      Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': name,
            'message': message,
            'origin': origin,
            'destiny': destiny,
            'price': price,
            'product': product,
          }
        },
      ),
    );
    if (resp.statusCode == 200) {
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }
}
