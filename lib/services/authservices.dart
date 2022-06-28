import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gestiones_app/global/environment.dart';
import 'package:gestiones_app/models/alldrivers_model.dart';
import 'package:gestiones_app/models/alltrips_model.dart';
import 'package:gestiones_app/models/login_response.dart';
import 'package:http/http.dart' as http;

class AuthServices with ChangeNotifier {
  final storage = const FlutterSecureStorage();

  bool? autenticando;
  UsuarioResponse? usuarioResponse;
  AllTripsResponse? allTripsResponse;
  static Future<String> getToken() async {
    const _storage = FlutterSecureStorage();
    String? token = await _storage.read(key: 'token');

    return token!;
  }

  static Future<void> deleteToken() async {
    const _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future login({required String email, required String password}) async {
    final data = {
      'email': email,
      'password': password,
    };
    final resp = await http.post(
      Uri.parse('${Enviroment.apiUrl}/login'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (resp.statusCode == 200) {
      autenticando = false;
      final loginResponse = loginResponseFromJson(resp.body);
      usuarioResponse = loginResponse.usuario;
      // await _guardarToken(token: loginResponse.token);
      await _guardarToken(token: loginResponse.token);

      return true;
    } else {
      return false;
    }
  }

  Future register({
    required String email,
    required String password,
    required String nombre,
    required String apellido,
    required String telefono,
  }) async {
    final data = {
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
      'password': password,
    };
    final resp = await http.post(
      Uri.parse('${Enviroment.apiUrl}/login/new'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (resp.statusCode == 200) {
      autenticando = false;
      final loginResponse = loginResponseFromJson(resp.body);
      usuarioResponse = loginResponse.usuario;
      await _guardarToken(token: loginResponse.token);
      // await _guardarToken(token: loginResponse.token);

      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await storage.read(key: 'token');
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/login/renew'),
      headers: {
        'Content-Type': 'application/json',
        'x-token': token.toString(),
      },
    );
    if (resp.statusCode == 200) {
      autenticando = false;
      final loginResponse = loginResponseFromJson(resp.body);
      usuarioResponse = loginResponse.usuario;
      await _guardarToken(token: loginResponse.token);
      // await _guardarToken(token: loginResponse.token);

      return true;
    } else {
      logOut();
      return false;
    }
  }

  Future _guardarToken({required String token}) async {
    return await storage.write(key: 'token', value: token);
  }

  Future logOut() async {
    await storage.delete(key: 'token');
  }

  Future postTrip({
    required String destiny,
    required String origin,
    required String description,
    required String price,
    required String product,
  }) async {
    final data = {
      'origin': origin,
      'destiny': destiny,
      'price': price,
      'realeaseBy': '${usuarioResponse!.nombre} ${usuarioResponse!.apellido}',
      'telefono': usuarioResponse!.telefono,
      'description': description,
      'product': product,
    };
    final resp = await http.post(
      Uri.parse('${Enviroment.apiUrl}/login/trips'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (resp.statusCode == 200) {
      // autenticando = false;
      // print(resp.body);
      // allTripsResponse = allTripsResponseFromJson(resp.body);

      return true;
    } else {
      return false;
    }
  }
}
