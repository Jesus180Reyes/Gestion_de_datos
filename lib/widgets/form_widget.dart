import 'package:flutter/material.dart';
import 'package:gestiones_app/ui/boton_azul.dart';
import 'package:gestiones_app/widgets/textfield_widget.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: 'Incio de Sesion',
          onPressed: () {
            Navigator.pushNamed(context, 'home');
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
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
      ],
    );
  }
}
