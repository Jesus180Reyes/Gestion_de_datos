import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter/services.dart';

void cambiarStatusLight() {
  services.SystemChrome.setSystemUIOverlayStyle(
      services.SystemUiOverlayStyle.light);
}

void cambiarStatusDark() {
  services.SystemChrome.setSystemUIOverlayStyle(
      services.SystemUiOverlayStyle.dark);
}

void cambiarColorStatus() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff2EB7B7),
      systemNavigationBarColor: Color(0xff2EB7B7),
    ),
  );
}
