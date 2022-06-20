// To parse this JSON data, do
//
//     final usuarioResponse = usuarioResponseFromJson(jsonString);

import 'dart:convert';

UsuarioResponse usuarioResponseFromJson(String str) =>
    UsuarioResponse.fromJson(json.decode(str));

String usuarioResponseToJson(UsuarioResponse data) =>
    json.encode(data.toJson());

class UsuarioResponse {
  UsuarioResponse({
    required this.apellido,
    required this.nombre,
    required this.email,
    required this.online,
    required this.createdAt,
    required this.uid,
  });

  final String nombre;
  final String email;
  final bool online;
  final DateTime createdAt;
  final String uid;
  final String apellido;

  factory UsuarioResponse.fromJson(Map<String, dynamic> json) =>
      UsuarioResponse(
        nombre: json["nombre"],
        email: json["email"],
        online: json["online"],
        createdAt: DateTime.parse(json["createdAt"]),
        uid: json["uid"],
        apellido: json["apellido"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "online": online,
        "createdAt": createdAt.toIso8601String(),
        "uid": uid,
        "apellido": apellido,
      };
}
