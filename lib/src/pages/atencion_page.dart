import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_dam_p2/src/pages/helpers_widget.dart';

class AtencionPage extends StatelessWidget {
  const AtencionPage({super.key});
  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of(context);

    return Scaffold(
        appBar: AppBarra(context, "", true),
        body: const Atencion() //documento principal del diseño
        );
  }
}

class Atencion extends StatefulWidget {
  const Atencion({super.key});
  @override
  _AtencionState createState() => _AtencionState();
}

class _AtencionState extends State<Atencion> {
  //region variables para Timer
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  //endregion

  @override
  void initState() {
    cronometrostart();
    // initPregunta();
    super.initState();
  }

  @override
  void deactivate() {
    timer!.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: documento(context)));
  }

  Column documento(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[Cuerpo(), chronometer(), Score(), SalirBoton(context)],
    );
  }

  Column Cuerpo() {
    return Column(
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
    return Container(
      height: 130,
      child: Image.asset("assets/img/ic_m40.png", width: 120, height: 120),
    );
  }

  Text Indicaciones() {
    return Text(
      "Selecciona la imagen que encuentres como esta",
      style: TextStyle(
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

  Container chronometer() {
    return Container(
        margin: const EdgeInsets.all(5),
        child: Text("$digitHours:$digitMinutes:$digitSeconds",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )));
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

  void cronometroStop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void cronometroreset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void cronometrostart() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }
}
