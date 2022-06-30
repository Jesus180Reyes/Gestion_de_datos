import 'package:flutter/material.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:gestiones_app/services/socketservices.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(
            milliseconds: 250,
          ),
        ).then(
          (value) => checkLoginState(context),
        ),
        builder: (context, snapshot) {
          return Center(
            child: Lottie.asset(
              'assets/loading.json',
              repeat: true,
            ),
          );
        },
      ),
    );
  }

  Future checkLoginState(context) async {
    final authservices = Provider.of<AuthServices>(context, listen: false);
    final socketServices = Provider.of<SocketService>(context, listen: false);
    final autenticado = await authservices.isLoggedIn();
    if (autenticado) {
      socketServices.connect();
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
