import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget TituloApp(modulo) {
  const Titulo = "Mental Games";
  return new Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        "assets/img/mentalgame_icono.png",
        height: 40,
        width: 40,
      ),
      Container(
        margin: new EdgeInsets.only(left: 5),
        child: Text(
          modulo == "" ? Titulo : Titulo + " - " + modulo,
        ),
      )
    ],
  );
}
