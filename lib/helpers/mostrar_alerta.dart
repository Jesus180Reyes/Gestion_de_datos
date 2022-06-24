import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:gestiones_app/services/usuarios_services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

mostrarAlerta(
    context, String titulo, subtitulo, String lottieUrl, bool? repeat) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
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
  final authServices = Provider.of<AuthServices>(context, listen: false);
  final userProvider = Provider.of<UsuariosService>(context, listen: false);
  final destinoController = TextEditingController();
  final origenController = TextEditingController();
  final precioController = TextEditingController();
  final descriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Íngresa Datos a Viaje'),
      content: SingleChildScrollView(
        child: Column(
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
              await userProvider.sendMessage(
                name: authServices.usuarioResponse!.nombre,
                message: descriptionController.text.trim(),
                origin: origenController.text.trim(),
                destiny: destinoController.text.trim(),
                price: precioController.text.trim(),
              );
              Navigator.pop(context);
              mostrarAlerta(
                context,
                'Datos enviados exitosamente',
                'Datos han sido enviados exitosamente',
                'assets/checked.json',
                true,
              );
            } else {
              mostrarAlerta(
                context,
                'Datos Incorrectos',
                'Datos son incorrectos vuelve a enviarlos correctamente',
                'assets/76705-error-animation.json',
                false,
              );
            }
          },
        ),
      ],
    ),
  );
}
