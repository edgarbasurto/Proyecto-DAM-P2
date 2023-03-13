import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget tituloApp(modulo) {
  const titulo = "Mental Games";
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        "assets/img/mentalgame_icono.png",
        color: Colors.white,
        height: 40,
        width: 40,
      ),
      Container(
        margin: const EdgeInsets.only(left: 5),
        child: Text(
          modulo == "" ? titulo : modulo,
        ),
      )
    ],
  );
}

Widget BackHomeButtom(BuildContext context) {
  return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'home');
      });
}

Widget AboutButtom(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.info_outline),
    tooltip:
        'Ir a la página de información sobre los desarrolladores de la aplicación',
    onPressed: () {
      Navigator.pushReplacementNamed(context, 'acerca_de');
    },
  );
}

AppBar AppBarra(BuildContext context, String modulo, bool BackButtom) {
  return AppBar(
    title: tituloApp(modulo),
    backgroundColor: Colors.blueGrey[300],
    actions: BackButtom
        ? <Widget>[BackHomeButtom(context), AboutButtom(context)]
        : [AboutButtom(context)],
  );
}

Widget SalirBoton(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 10, bottom: 30),
      child: ElevatedButton(
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
      ));
}

double doubleParse(String valor) {
  return double.tryParse(valor) ?? 0;
}

double doubleParseint(int valor) {
  return double.parse(valor.toString()) ?? 0;
}

void notificar(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 20);
}
