import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final authServices = Provider.of<AuthServices>(context, listen: false);
  final userProvider = Provider.of<UsuariosService>(context, listen: false);
  final destinoController = TextEditingController();
  final origenController = TextEditingController();
  final precioController = TextEditingController();
  final descriptionController = TextEditingController();
  final typeController = TextEditingController();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Íngresa Datos a Viaje'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                textCapitalization: TextCapitalization.words,
                controller: destinoController,
                decoration: const InputDecoration(
                  hintText: 'Destino',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                textCapitalization: TextCapitalization.words,
                controller: origenController,
                decoration: const InputDecoration(
                  hintText: 'Origen',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: precioController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Precio',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
                hint: const Text('Tipo de Producto'),
                icon: const Icon(FontAwesomeIcons.shrimp, color: Colors.orange),
                items: const [
                  DropdownMenuItem(
                    value: 'Entero Fresco(Cabezas)',
                    child: Text('Entero Fresco (Cabezas)'),
                  ),
                  DropdownMenuItem(
                    value: 'Shellon (Colas)',
                    child: Text('Shellon (Colas)'),
                  ),
                  DropdownMenuItem(
                    value: 'PVD (Pelado Abierto)',
                    child: Text('PVD (Pelado Abierto)'),
                  ),
                  DropdownMenuItem(
                    value: 'PND (Pelado Al Redondo)',
                    child: Text('PND (Pelado Al Redondo)'),
                  ),
                  DropdownMenuItem(
                    value: 'PPV',
                    child: Text('PPV (Pelado con Cuchillo)'),
                  ),
                  DropdownMenuItem(
                    value: 'PUD (Pelado Con Aguja)',
                    child: Text('PUD (Pelado Con Aguja)'),
                  ),
                ],
                onChanged: (value) {
                  typeController.text = value!;
                },
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                maxLength: 200,
                maxLines: null,
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Descripción',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
              product: typeController.text.trim(),
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
