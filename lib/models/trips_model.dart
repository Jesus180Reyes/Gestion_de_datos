// To parse this JSON data, do
//
//     final tripsModel = tripsModelFromJson(jsonString);

import 'dart:convert';

import 'package:gestiones_app/models/alltrips_model.dart';

TripsModel tripsModelFromJson(String str) =>
    TripsModel.fromJson(json.decode(str));

String tripsModelToJson(TripsModel data) => json.encode(data.toJson());

class TripsModel {
  TripsModel({
    required this.ok,
    required this.tripsH,
  });

  final bool ok;
  final List<AllTripsResponse> tripsH;

  factory TripsModel.fromJson(Map<String, dynamic> json) => TripsModel(
        ok: json["ok"],
        tripsH: List<AllTripsResponse>.from(
            json["tripsH"].map((x) => AllTripsResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "tripsH": List<dynamic>.from(tripsH.map((x) => x.toJson())),
      };
}
