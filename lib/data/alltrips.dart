import 'package:flutter/material.dart';
import 'package:gestiones_app/models/alltrips_model.dart';

final List allTrips = [
  AllTripsModel(
    id: '1',
    destiny: 'Suamcua',
    origin: 'Nova Planta',
    date: DateTime.now(),
    hour: TimeOfDay.now().toString(),
    price: '35,456.00',
  ),
  AllTripsModel(
    id: '12',
    destiny: 'Suamcua',
    origin: 'Nova Planta',
    date: DateTime.now(),
    hour: TimeOfDay.now().toString(),
    price: '23,800.90',
  ),
  AllTripsModel(
    id: '3',
    destiny: 'Los Nilos',
    origin: 'Nova Planta',
    date: DateTime.now(),
    hour: TimeOfDay.now().toString(),
    price: '12,300.80',
  ),
  AllTripsModel(
    id: '4',
    destiny: 'Los Agrolibano',
    origin: 'Nova Planta',
    date: DateTime.now(),
    hour: TimeOfDay.now().toString(),
    price: '12,435.00',
  ),
  AllTripsModel(
    id: '5',
    destiny: 'Granjas Marinas',
    origin: 'Nova Planta',
    date: DateTime.now(),
    hour: TimeOfDay.now().toString(),
    price: '12,435.00',
  ),
];
