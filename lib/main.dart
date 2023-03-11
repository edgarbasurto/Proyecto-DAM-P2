import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_dam_p2/src/percepcion/percepcion_page.dart';
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
        },
        theme: ThemeData(primaryColor: Colors.lightBlue),
      ),
    );
  }
}
