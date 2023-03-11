import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

Widget TituloApp(modulo) {
  const Titulo = "Mental Games";
  return new Row(
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
        margin: new EdgeInsets.only(left: 5),
        child: Text(
          modulo == "" ? Titulo : modulo,
        ),
      )
    ],
  );
}

Widget BackHomeButtom(BuildContext context) {
  return new IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'home');
      });
}

Widget AboutButtom(BuildContext context) {
  return new IconButton(
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
    title: TituloApp(modulo),
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
