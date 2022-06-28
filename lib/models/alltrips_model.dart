// To parse this JSON data, do
//
//     final allTripsResponse = allTripsResponseFromJson(jsonString);

import 'dart:convert';

AllTripsResponse allTripsResponseFromJson(String str) =>
    AllTripsResponse.fromJson(json.decode(str));

String allTripsResponseToJson(AllTripsResponse data) =>
    json.encode(data.toJson());

class AllTripsResponse {
  AllTripsResponse({
    required this.destiny,
    required this.origin,
    required this.realeaseBy,
    required this.phone,
    required this.price,
    required this.description,
    required this.createdAt,
    required this.hourAt,
    required this.uid,
  });

  final String destiny;
  final String origin;
  final String realeaseBy;
  final String price;
  final String description;
  final DateTime createdAt;
  final String hourAt;
  final String uid;
  final String phone;

  factory AllTripsResponse.fromJson(Map<String, dynamic> json) =>
      AllTripsResponse(
        destiny: json["destiny"],
        origin: json["origin"],
        realeaseBy: json["realeaseBy"],
        price: json["price"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        hourAt: json["hourAt"],
        uid: json["uid"],
        phone: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "destiny": destiny,
        "origin": origin,
        "realeaseBy": realeaseBy,
        "price": price,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "hourAt": hourAt,
        "uid": uid,
        "telefono": phone,
      };
}
