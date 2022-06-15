import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String title;
  final Function? onPressed;
  const BotonAzul({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(16),
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          return;
        }
      },
      color: Colors.blueAccent,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
