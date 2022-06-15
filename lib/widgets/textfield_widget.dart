import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType keyboardType;
  final bool? onCapitalLetter;
  const TextFieldWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.controller,
    this.obscureText = false,
    required this.keyboardType,
    this.onCapitalLetter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textCapitalization: onCapitalLetter == true
            ? TextCapitalization.words
            : TextCapitalization.none,
        textAlign: TextAlign.start,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: InputBorder.none,
          hintText: title,
          border: InputBorder.none,
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
