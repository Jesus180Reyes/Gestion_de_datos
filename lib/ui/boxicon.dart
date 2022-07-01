import 'package:flutter/material.dart';

class BoxIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function? onPressed;
  const BoxIcon({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 20),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
