import 'package:flutter/material.dart';
import 'package:gestiones_app/pages/create_report_page.dart';
import 'package:gestiones_app/pages/create_travel_page.dart';
import 'package:gestiones_app/pages/loading_page.dart';
import 'package:gestiones_app/pages/reports_page.dart';
import 'package:gestiones_app/pages/trips_details_page.dart';
import 'package:gestiones_app/pages/trips_page.dart';
import 'package:gestiones_app/pages/usuariosonline_page.dart';
import 'package:gestiones_app/services/authservices.dart';
import 'package:gestiones_app/services/coloprovider.dart';
import 'package:gestiones_app/services/socketservices.dart';
import 'package:gestiones_app/services/usuarios_services.dart';
import 'package:gestiones_app/themes/apptheme.dart';
import 'package:provider/provider.dart';
import 'pages/pages.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(create: (_) => AuthServices()),
        ChangeNotifierProvider(create: (_) => UsuariosService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestiones App',
      initialRoute: 'loading',
      routes: {
        'home': (context) => const HomePage(),
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'loading': (context) => const LoadingPage(),
        'usersOnline': (context) => const UsuariosOnlinePage(),
        'tripsH': (context) => const TripsPage(),
        'tripsD': (context) => const TripsDetailsPage(),
        'create_trip': (context) => const CreateTravelPage(),
        'create_report': (context) => const CreateReportPage(),
        'reports': (context) => const ReportsPage(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
