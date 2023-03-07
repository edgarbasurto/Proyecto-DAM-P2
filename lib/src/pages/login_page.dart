import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_dam_p2/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(children: <Widget>[
              Text('Ingreso', style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 45.0),
              _crearEmail(bloc),
              SizedBox(height: 30.0),
              _crearPassword(bloc),
              SizedBox(height: 30.0),
              _IngresarBoton(bloc),
            ]),
          ),
          Text('¿Olvidó su Contraseña?'),
          SizedBox(height: 40.0),
          _SalirBoton(bloc),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.alternate_email, color: Colors.lightBlue),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrónico',
                counterText: snapshot.data,
                //errorText: snapshot.error.toString()
              ),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.lightBlue),
              labelText: 'Contraseña',
              counterText: snapshot.data,
              //errorText: snapshot.error.toString()
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _IngresarBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Text("Ingresar".toUpperCase(), style: TextStyle(fontSize: 14)),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.lightBlue,
          ),
          // shape:
          //     RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),

          // color: Colors.lightBlue,
          // textColor: Colors.black,
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
        );
      },
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

  _login(LoginBloc bloc, BuildContext context) {
    print(DateTime.now());
    print('============================');
    print('Email: ${bloc.email}');
    print('Password: ${bloc.password}');
    print('============================');
    Navigator.pushReplacementNamed(context, 'home');
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

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoAzul = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Colors.lightBlue.shade300, Colors.lightBlue])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoAzul,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, left: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Image.asset('assets/img/mentalgame_icono.png',
                  color: Colors.white, width: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text(
                'Mental Games',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
