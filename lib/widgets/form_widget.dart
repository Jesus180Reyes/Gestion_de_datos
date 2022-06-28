import 'package:flutter/material.dart';
import 'package:gestiones_app/helpers/mostrar_alerta.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:gestiones_app/services/socketservices.dart';
import 'package:gestiones_app/ui/boton_azul.dart';
import 'package:gestiones_app/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    final socketServices = Provider.of<SocketService>(context);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      children: [
        TextFieldWidget(
          controller: emailController,
          title: 'Email',
          icon: Icons.email,
          keyboardType: TextInputType.emailAddress,
        ),
        TextFieldWidget(
          controller: passwordController,
          obscureText: true,
          icon: Icons.password,
          title: 'Contrasena',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20),
        BotonAzul(
          title: 'Inicio de Sesion',
          onPressed: () async {
            FocusScope.of(context).unfocus();
            final loginOk = await authServices.login(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              // Navigator.pushNamed(context, 'home');
            );

            if (loginOk) {
              socketServices.connect();
              Navigator.pushReplacementNamed(context, 'home');
            } else {
              mostrarAlerta(
                context,
                'login Incorrecto',
                'Revisa tus credenciales ',
                'assets/error-animation.json',
                false,
              );
            }
          },
        ),
      ],
    );
  }
}

class CustomFormRegister extends StatelessWidget {
  const CustomFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthServices>(context);
    final socketProvider = Provider.of<SocketService>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final phoneController = TextEditingController();

    return Column(
      children: [
        TextFieldWidget(
          controller: nameController,
          onCapitalLetter: true,
          title: 'Nombres',
          icon: Icons.person,
          keyboardType: TextInputType.name,
        ),
        TextFieldWidget(
          onCapitalLetter: true,
          controller: lastNameController,
          title: 'Apellidos',
          icon: Icons.person,
          keyboardType: TextInputType.name,
        ),
        TextFieldWidget(
          controller: phoneController,
          title: 'Numero de Telefono ',
          icon: Icons.phone,
          keyboardType: TextInputType.phone,
        ),
        TextFieldWidget(
          controller: emailController,
          title: 'Email',
          icon: Icons.email,
          keyboardType: TextInputType.emailAddress,
        ),
        TextFieldWidget(
          controller: passwordController,
          obscureText: true,
          icon: Icons.password,
          title: 'Contrasena',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20),
        BotonAzul(
          title: 'Registrarse',
          onPressed: () async {
            final registroOk = await authProvider.register(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              nombre: nameController.text.trim(),
              apellido: lastNameController.text.trim(),
              telefono: phoneController.text.trim(),
            );
            if (registroOk == true) {
              socketProvider.connect();
              Navigator.pushReplacementNamed(context, 'home');
            } else {
              mostrarAlerta(
                context,
                'Registro Incorrecto',
                registroOk.toString(),
                'assets/76705-error-animation.json',
                false,
              );
            }
          },
        ),
      ],
    );
  }
}
