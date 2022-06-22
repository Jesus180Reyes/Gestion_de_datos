import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:provider/provider.dart';

mostrarAlerta(context, String titulo, subtitulo) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: [
          MaterialButton(
            child: const Text('Ok'),
            elevation: 5,
            textColor: Colors.blue,
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
  final authServices = Provider.of<AuthServices>(context, listen: false);
  final destinoController = TextEditingController();
  final origenController = TextEditingController();
  final precioController = TextEditingController();
  final descriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Íngresa Datos a Viaje'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: destinoController,
            decoration: const InputDecoration(
              labelText: 'Destino',
            ),
          ),
          TextField(
            controller: origenController,
            decoration: const InputDecoration(
              labelText: 'Origen',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          TextField(
            keyboardType: TextInputType.phone,
            controller: precioController,
            decoration: const InputDecoration(
              labelText: 'Precio',
            ),
          ),
        ],
      ),
      actions: [
        MaterialButton(
          child: const Text('Enviar Datos'),
          elevation: 5,
          color: Colors.indigo,
          textColor: Colors.white,
          onPressed: () async {
            final dataOk = await authServices.postTrip(
              destiny: destinoController.text.trim(),
              origin: origenController.text.trim(),
              description: descriptionController.text.trim(),
              price: precioController.text.trim(),
            );
            if (dataOk == true) {
              Navigator.pop(context);
              mostrarAlerta(
                context,
                'Datos enviados exitosamente',
                'los datos han sido enviados exitosamente',
              );
            } else {
              mostrarAlerta(
                context,
                'Datos Incorrectos',
                'Los datos son incorrectos vuelve a enviarlos correctamente',
              );
            }
          },
        ),
      ],
    ),
  );
}
