import 'package:flutter/cupertino.dart';

class DialogItems {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onTap;

  DialogItems({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });
}
