import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestiones_app/helpers/helpers.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:provider/provider.dart';

class CreateReportPage extends StatelessWidget {
  const CreateReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Report'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: const _CustomFormReport(),
    );
  }
}

// TODO: Debo crear instancias del backend para poder crear un reporte
class _CustomFormReport extends StatelessWidget {
  const _CustomFormReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 60,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: const TextField(
              textCapitalization: TextCapitalization.words,
              // controller: destinoController,
              decoration: InputDecoration(
                hintText: 'Destino',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: const TextField(
              textCapitalization: TextCapitalization.words,
              // controller: origenController,
              decoration: InputDecoration(
                hintText: 'Origen',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: const TextField(
              keyboardType: TextInputType.phone,
              // controller: precioController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Precio',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
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
                // typeController.text = value!;
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
            child: const TextField(
              textCapitalization: TextCapitalization.sentences,
              maxLength: 200,
              maxLines: null,
              // controller: descriptionController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Descripción',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            disabledColor: Colors.grey[300],
            disabledTextColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            height: 60,
            color: Colors.orange,
            onPressed: authServices.isSaving != false
                ? null
                : () async {
                    // final dataOk = await authServices.postTrip(
                    //   destiny: destinoController.text.trim(),
                    //   origin: origenController.text.trim(),
                    //   description: descriptionController.text.trim(),
                    //   price: precioController.text.trim(),
                    //   product: typeController.text.trim(),
                    // );

                    // if (dataOk == true) {
                    //   await userProvider.sendMessage(
                    //     name: authServices.usuarioResponse!.nombre +
                    //         ' ' +
                    //         authServices.usuarioResponse!.apellido.trim(),
                    //     message: descriptionController.text.trim(),
                    //     origin: origenController.text.trim(),
                    //     destiny: destinoController.text.trim(),
                    //     price: precioController.text.trim(),
                    //     product: typeController.text.trim(),
                    //   );
                    //   mostrarAlerta(
                    //     context,
                    //     'Datos enviados exitosamente',
                    //     'Datos han sido enviados exitosamente',
                    //     'assets/checked.json',
                    //     true,
                    //   );
                    //   descriptionController.clear();
                    //   origenController.clear();
                    //   destinoController.clear();
                    //   precioController.clear();
                    // } else {
                    //   mostrarAlerta(
                    //     context,
                    //     'Datos Incorrectos',
                    //     'Datos son incorrectos vuelve a enviarlos correctamente',
                    //     'assets/76705-error-animation.json',
                    //     false,
                    //   );
                    // }
                  },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                authServices.isSaving
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        authServices.isSaving == false
                            ? 'Crear Reporte'
                            : 'Enviando Datos',
                        style: TextStyle(
                          color: authServices.isSaving == false
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                const SizedBox(width: 10),
                const Icon(Icons.send, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
