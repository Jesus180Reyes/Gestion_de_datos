// To parse this JSON data, do
//
//     final usuariosModel = usuariosModelFromJson(jsonString);

import 'dart:convert';

import 'package:gestiones_app/models/alldrivers_model.dart';

UsuariosModel usuariosModelFromJson(String str) =>
    UsuariosModel.fromJson(json.decode(str));

String usuariosModelToJson(UsuariosModel data) => json.encode(data.toJson());

class UsuariosModel {
  UsuariosModel({
    required this.ok,
    required this.usuarios,
  });

  final bool ok;
  final List<UsuarioResponse> usuarios;

  factory UsuariosModel.fromJson(Map<String, dynamic> json) => UsuariosModel(
        ok: json["ok"],
        usuarios: List<UsuarioResponse>.from(
            json["usuarios"].map((x) => UsuarioResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
      };
}
