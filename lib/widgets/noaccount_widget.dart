import 'package:flutter/material.dart';

class NoAccountWidget extends StatelessWidget {
  final String route;
  const NoAccountWidget({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Todavia no tienes una cuenta?',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () => Navigator.pushNamed(context, route),
          child: const Text(
            'Crea una Ahora',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
