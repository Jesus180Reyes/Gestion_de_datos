import 'package:flutter/material.dart';
import 'package:gestiones_app/services/coloprovider.dart';
import 'package:gestiones_app/themes/apptheme.dart';
import 'package:provider/provider.dart';
import 'pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gestiones App',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'login': (context) => const LoginPage(),
          'register': (context) => const RegisterPage(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
