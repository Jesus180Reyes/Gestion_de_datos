import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:gestiones_app/ui/label.dart';
import 'package:gestiones_app/widgets/form_widget.dart';
import 'package:gestiones_app/widgets/noaccount_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 5),
            child: SizedBox(
              height: size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Estos Son todos los hijos Del Padre
                // Estos son todos los Widgets que se van a mostrar en pantalla 👇👇👇

                children: const [
                  Label(title: 'Inicio de Sesion'),
                  SizedBox(height: 30),
                  CustomForm(),
                  SizedBox(height: 30),
                  NoAccountWidget(route: 'register'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
