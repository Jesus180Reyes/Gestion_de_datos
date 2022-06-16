import 'package:flutter/material.dart';

class CustomWelcomeWidgets extends StatelessWidget {
  const CustomWelcomeWidgets({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.22,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: size.width * 0.6,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Malik',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[200],
                  ),
                ),
                Text(
                  'Welcome to your dashboard',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            // color: Colors.green,
            padding: const EdgeInsets.only(right: 25, bottom: 10, top: 17),
            alignment: Alignment.topCenter,
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.indigo,
              child: Text(
                'TR',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
