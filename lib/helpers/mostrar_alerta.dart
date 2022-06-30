import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gestiones_app/data/dialog_items_data.dart';
import 'package:lottie/lottie.dart';

mostrarAlerta(
    context, String titulo, subtitulo, String lottieUrl, bool? repeat) {
  if (Platform.isAndroid) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 25),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Lottie.asset(
                  lottieUrl,
                  repeat: repeat ?? true,
                ),
              ),
              Text(
                subtitulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            color: Colors.indigo,
            child: const Text(
              'Ok',
              style: TextStyle(fontSize: 16),
            ),
            elevation: 5,
            textColor: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  } else {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('ok'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

tripDialog(context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: const EdgeInsets.only(top: 25, left: 10, bottom: 20),
      title: const Text(
        'Selecciona una Opcion',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ...dialogItemsData
                .map(
                  (e) => ListTile(
                    contentPadding:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    leading: Icon(e.icon, color: Colors.black, size: 33),
                    title: Text(
                      e.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(e.subtitle),
                    onTap: () {
                      e.onTap(context);
                    },
                  ),
                )
                .toList(),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Divider(height: 1, color: Colors.black, thickness: 1),
            ),
          ],
        ),
      ),
      actions: [
        InkWell(
          splashColor: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              'Cerrar'.toUpperCase(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
