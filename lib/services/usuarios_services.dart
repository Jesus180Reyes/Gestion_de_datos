import 'package:flutter/cupertino.dart';
import 'package:gestiones_app/global/environment.dart';
import 'package:gestiones_app/models/alldrivers_model.dart';
import 'package:gestiones_app/models/usuarios_model.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:http/http.dart' as http;

class UsuariosService with ChangeNotifier {
  List<UsuarioResponse> users = [];
  UsuariosService() {
    getUsuarios();
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
    // ignore: iterable_contains_unrelated_type
    users = usuariosResponse.usuarios;
    notifyListeners();
  }
}
