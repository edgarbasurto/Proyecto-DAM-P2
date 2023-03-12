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
      child: Image.asset("assets/img/ic_uglogo.png", width: 120, height: 120),
    );
  }

  Text Indicaciones() {
    return new Text(
      "Aquí va ir la pregunta",
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: "sans-serif-medium"),
    );
  }

  Text Score() {
    return new Text(
      "Aquí va ir el score",
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: "sans-serif-medium"),
    );
  }

  Text Chronometer() {
    return new Text(
      "Aquí va ir el chronometer",
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
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
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
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
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
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
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
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        ),
        Container(
          height: 60,
          child: Image.asset("assets/img/ic_uglogo.png", width: 70, height: 60),
        )
      ],
    );
  }
}
