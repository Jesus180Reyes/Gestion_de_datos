import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestiones_app/models/dialog_items_model.dart';

final List<DialogItems> dialogItemsData = [
  DialogItems(
    title: 'Gestionar Viaje',
    subtitle: 'Gestiona datos para uso del sistema',
    icon: FontAwesomeIcons.truckArrowRight,
    onTap: (context) => Navigator.pushNamed(context, 'create_trip'),
  ),
  DialogItems(
    title: 'Crear Reportes',
    subtitle: 'Crear Reportes de cada Producto en el Sistema',
    icon: FontAwesomeIcons.shrimp,
    onTap: (context) => Navigator.pushNamed(context, 'create_report'),
  ),
  DialogItems(
    title: 'Gestionar Viaje',
    subtitle: 'Gestiona datos para uso del sistema',
    icon: FontAwesomeIcons.truckField,
    onTap: () {},
  ),
];
