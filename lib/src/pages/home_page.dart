import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_dam_p2/src/bloc/provider.dart';
import 'package:proyecto_dam_p2/src/pages/helpers_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: TituloApp("")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text('Email: ${bloc.email}'),
          Divider(),
          Text('Password: ${bloc.password}'),
          Spacer(),
          _SalirBoton(bloc, context),
          Spacer()
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
