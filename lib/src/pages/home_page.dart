import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_dam_p2/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Mental Games')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text('Email: ${bloc.email}'),
          Divider(),
          Text('Password: ${bloc.password}'),
          Spacer(),
          _SalirBoton(bloc),
          Spacer()
        ],
      ),
    );
  }

  Widget _SalirBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.salirValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Text("Salir".toUpperCase(), style: TextStyle(fontSize: 14)),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.lightBlue,
          ),
          // shape:
          //     RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),

          // color: Colors.lightBlue,
          // textColor: Colors.black,
          onPressed: snapshot.hasData ? () => _salir(bloc, context) : null,
        );
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
