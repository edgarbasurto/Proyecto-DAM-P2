import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_dam_p2/src/bloc/provider.dart';
import 'package:proyecto_dam_p2/src/pages/acerca_de_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a Mental Games'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip:
                'Ir a la página de información sobre los desarrolladores de la aplicación',
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'acerca_de');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text('Email: ${bloc.email}'),
          SizedBox(height: 30.0),
          //Divider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'aprendizaje');
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/img/ic_aprendizaje.png',
                          height: 120,
                          width: 120,
                        ),
                        Text(
                          'Aprendizaje.',
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'atencion');
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/img/ic_atencion.png',
                          height: 120,
                          width: 120,
                        ),
                        Text(
                          'Atención.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'percepcion');
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/img/ic_percepcion.png',
                          height: 120,
                          width: 120,
                        ),
                        Text(
                          'Percepción.',
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'pensamiento');
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/img/ic_pensamiento.png',
                          height: 120,
                          width: 120,
                        ),
                        Text(
                          'Pensamiento.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          _SalirBoton(bloc, context),
        ],
      ),
    );
  }

  Widget _SalirBoton(LoginBloc bloc, BuildContext context) {
    return ElevatedButton(
      child:
          Text("Cerrar sesión".toUpperCase(), style: TextStyle(fontSize: 14)),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
      ),
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushNamedAndRemoveUntil(
            context, 'login', (Route<dynamic> route) => false);
      },
    );
  }

  _salir(LoginBloc bloc, BuildContext context) {
    print(DateTime.now());
    print('============================');
    print('Ud. ha salido del sistema:');
    print('============================');
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
