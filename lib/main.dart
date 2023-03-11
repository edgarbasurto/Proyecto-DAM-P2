import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_dam_p2/src/pages/acerca_de_page.dart';
import 'package:proyecto_dam_p2/src/pages/aprendizaje_page.dart';
import 'package:proyecto_dam_p2/src/pages/atencion_page.dart';
import 'package:proyecto_dam_p2/src/pages/pensamiento_page.dart';
import 'package:proyecto_dam_p2/src/pages/percepcion_page.dart';
// Importamos la configuarcion creada por FlutterFire
import 'firebase_options.dart';

import 'package:proyecto_dam_p2/src/bloc/provider.dart';
import 'package:proyecto_dam_p2/src/pages/home_page.dart';
import 'package:proyecto_dam_p2/src/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MentalGames',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'acerca_de': (BuildContext context) => AcercaDePage(),
          'aprendizaje': (BuildContext context) => AprendizajePage(),
          'atencion': (BuildContext context) => AtencionPage(),
          'pensamiento': (BuildContext context) => PensamientoPage(),
          'percepcion': (BuildContext context) => PercepcionPage(),
        },
        theme: ThemeData(primaryColor: Colors.lightBlue),
      ),
    );
  }
}
