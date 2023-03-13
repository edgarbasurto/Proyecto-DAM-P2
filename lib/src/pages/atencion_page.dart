import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_dam_p2/src/pages/helpers_widget.dart';

class AtencionPage extends StatelessWidget {
  const AtencionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarra(context, "", true),
        body: Documento(context) //documento principal del diseño
        );
  }

  Column Documento(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[Cuerpo(), Chronometer(), Score(), SalirBoton(context)],
    );
  }

  Column Cuerpo() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ImagenTop(),
        Indicaciones(),
        Respuestas(),
      ],
    );
  }

  Container ImagenTop() {
    return new Container(
      height: 130,
      child: Image.asset("assets/img/ic_m40.png", width: 120, height: 120),
    );
  }

  Text Indicaciones() {
    return new Text(
      "Selecciona la imagen que encuentres como esta",
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: "sans-serif-medium"),
    );
  }

  Text Score() {
    return new Text(
      "Puntuación: 000",
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: "sans-serif-medium"),
    );
  }

  Text Chronometer() {
    return new Text(
      "00:00:00",
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: "sans-serif-medium"),
    );
  }

  Column Respuestas() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Linea1(),
        Linea2(),
        Linea3(),
        Linea4(),
      ],
    );
  }

  Row Linea1() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m45.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m50.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m41.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m46.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m53.png", width: 70, height: 60),
        )
      ],
    );
  }

  Row Linea2() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m47.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m40.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m51.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m52.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m42.png", width: 70, height: 60),
        )
      ],
    );
  }

  Row Linea3() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m55.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m48.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m49.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m43.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m44.png", width: 70, height: 60),
        )
      ],
    );
  }

  Row Linea4() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m54.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m38.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m37.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m36.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_m39.png", width: 70, height: 60),
        )
      ],
    );
  }
}
