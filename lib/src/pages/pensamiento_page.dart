import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PensamientoPage extends StatefulWidget {
  const PensamientoPage({super.key});

  @override
  State<PensamientoPage> createState() => _PensamientoPageState();
}

class _PensamientoPageState extends State<PensamientoPage> {
  static final int MAXPREGUNTAS = 10;
  late FirebaseFirestore bdService = FirebaseFirestore.instance;
  late String IdUsuario;

  //Region de variables para el Timer
  late Timer cronometro;
  //int timeLeft = 0;
  int tiempoTranscurrido = 0;

  //region variables para preguntas
  late String respuesta;
  late String idJuego;
  late int intentos;
  int intId = 0;
  //endregion

  //region variables para score
  late int scoreActual;
  late int totalJuegos;
  late int totalIntentos;
  //endregion

  //region Inicializacion de Objetos
  late Text txtScore;
  late Text txtIndicaciones;
  late Image imgReal;
  late Image imgOpc1;
  late Image imgOpc2;
  late LinearProgressIndicator progStatus;
  late LinearProgressIndicator progAciertos;
  //endregion

  @override
  void initState() {
    super.initState();
    txtIndicaciones = Text('');
    txtScore = Text('');
    intentos = 1;
    totalJuegos = 0;
    //this.setTitle('Pensamiento');
    cargarScoreUsuario();
    buscarPregunta();
    //txtIndicaciones.setText(R.string.pensa_strindica_found);
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      IdUsuario = user.uid;
    }
  }

  @override
  void dispose() {
    cronometro.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pensamiento'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  txtIndicaciones,
                  SizedBox(height: 16),
                  Expanded(child: imgReal),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      child: imgOpc1,
                      onTap: () {
                        onImgClick(context, imgOpc1);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      child: imgOpc2,
                      onTap: () {
                        onImgClick(context, imgOpc2);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              value: tiempoTranscurrido / 20,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  void timerStart() {
    if (cronometro != null && cronometro.isActive) {
      cronometro.cancel();
    }

    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        tiempoTranscurrido += 1;
      });
    });
  }

  void timerStop() {
    if (cronometro != null && cronometro.isActive) {
      cronometro.cancel();
    }
  }

  void limpiarPreguntas() {
    setState(() {
      //progStatus = true;
      intentos = 1;
      respuesta = "";
      txtIndicaciones = Text('Espere por favor');
      imgReal = Image.asset('assets/img/empty.png');
      imgOpc1 = Image.asset('assets/img/empty.png');
      imgOpc2 = Image.asset('assets/img/empty.png');
    });
  }

  void buscarPregunta() {
    if (totalJuegos > MAXPREGUNTAS) {
      limpiarPreguntas();
      txtIndicaciones = Text('Espere por favor');
    } else {
      intId++;
      String tmpPregunta = "Q" + intId.toString();

      //Carga en memoria la colección
      CollectionReference logUsuario = bdService
          .collection('pensamiento_score')
          .doc(IdUsuario)
          .collection('logs');

      //Consulta, se verifica si el juego ya fue realizado.
      Query query = logUsuario.where('idjuego', isEqualTo: tmpPregunta);

      query.get().then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isEmpty) {
          cargarPregunta(tmpPregunta);
        } else {
          buscarPregunta();
        }
      }).catchError((error) {
        print('Error getting documents: $error');
      });
    }
  }

  void cargarPregunta(String juego) {
    limpiarPreguntas();
    idJuego = juego;
    DocumentReference pregunta =
        bdService.collection("pensamiento_questions").doc(juego);

    pregunta.get().then((DocumentSnapshot document) {
      if (document.exists) {
        int newHeight = 0;

        txtIndicaciones = Text(PensamientoLibrary.getIndicaciones(
            document.get("indicaciones").toString()));
        respuesta = document.get("respuesta").toString().toUpperCase();

        newHeight = int.parse(document.get("ImgBaseHeight").toString());
        imgReal = Image.asset(
          PensamientoLibrary.getImagen(document.get("ImgBase").toString()),
          height: newHeight.toDouble(),
        );

        imgOpc1 = Image.asset('assets/img/ic_m67.png');
        imgOpc2 = Image.asset('assets/img/ic_m66.png');
        timerStart();
        final double scale =
            MediaQuery.of(context).devicePixelRatio; // Mover esta línea aquí
      } else {
        print('Documento no encontrado');
      }
    }).catchError((error) {
      print('Error getting documents: $error');
    });
  }

  void onImgClick(BuildContext context, Widget widget) {
    if (widget is Image) {
      String transitionName = '';
      if (widget.semanticLabel != null && widget.semanticLabel!.isNotEmpty) {
        transitionName = widget.semanticLabel!;
      }
      if (transitionName.trim().toUpperCase() == respuesta) {
        timerStop();
        guardarProgreso();
        actualizarScoreUsuario();
        print('Correcto');
        buscarPregunta();
      } else {
        print('Intento: $intentos fallido');
        intentos++;
      }
    }
  }

  void guardarProgreso() {
    Map<String, dynamic> progreso = {
      "intentos": intentos,
      "tiempo": tiempoTranscurrido,
      "idjuego": idJuego,
    };
    //almacena el log progreso
    bdService
        .collection("pensamiento_score")
        .doc(IdUsuario)
        .collection("logs")
        .doc(DateTime.now().toString())
        .set(progreso)
        .then((value) => {print("DocumentSnapshot successfully written!")})
        .catchError((error) => {print("Error writing document: $error")});
  }

  /*void cargarScoreUsuario() {
    intId++;
    String tmpPregunta = "Q" + intId.toString();

    if (totalJuegos > MAXPREGUNTAS) {
      limpiarPreguntas();
      txtIndicaciones = Text('Espere por favor.');
    } else {
      //Carga en memoria la colección
      CollectionReference logUsuario = bdService
          .collection("pensamiento_score")
          .doc(IdUsuario)
          .collection("logs");

      //Consulta, se verifica si el juego ya fue realizado.
      Query query = logUsuario.where("idjuego", isEqualTo: tmpPregunta);
      query.get().then((QuerySnapshot querySnapshot) {
        int rows = querySnapshot.docs.length;
        if (rows == 0) {
          cargarPregunta(tmpPregunta);
        } else {
          buscarPregunta();
        }

        if (querySnapshot.size == 0) {
          print('Documento no encontrado');
        } else {
          print('Ha ocurrido un error');
        }

        if (querySnapshot.docs.isNotEmpty) {
          DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
          txtIndicaciones = Text(
            PensamientoLibrary.getIndicaciones(
                documentSnapshot.get("indicaciones").toString()),
          );
          respuesta =
              documentSnapshot.get("respuesta").toString().toUpperCase();

          int newHeight = int.parse(documentSnapshot
              .get("ImgBaseHeight")
              .toString()); // parse string to int
          imgReal = Image.asset(
            PensamientoLibrary.getImagen(
                documentSnapshot.get("ImgBase").toString()),
            height: newHeight.toDouble(),
          );
          imgOpc1 = Image.asset('assets/img/ic_m67.png');
          imgOpc2 = Image.asset('assets/img/ic_m66.png');
          timerStart();
          //setState(() {
          //progStatus = false;
          //});
        }
      }).catchError((error) {
        print("Error obteniendo el documento: $error");
      });
    }
  }*/

  void cargarScoreUsuario() {
    DocumentReference pregunta =
        bdService.collection('pensamiento_score').doc(IdUsuario);
    pregunta.snapshots().listen((DocumentSnapshot document) {
      if (document.exists) {
        totalIntentos = int.parse(document.get('intentos').toString());
        totalJuegos = int.parse(document.get('total_juegos').toString());
        scoreActual = int.parse(document.get('tasa_exito').toString());
      } else {
        totalIntentos = 0;
        totalJuegos = 0;
        scoreActual = 100;
      }
      //progAciertos.value = scoreActual.toDouble();
      txtScore = Text('$scoreActual% de aciertos.');
    }, onError: (e) {
      print('Listen failed: $e');
    });
  }

  void actualizarScoreUsuario() {
    totalJuegos++;
    totalIntentos += intentos;
    Map<String, dynamic> score = {
      'intentos': totalIntentos,
      'total_juegos': totalJuegos,
      'tasa_exito': (totalJuegos * 100 / totalIntentos).toInt(),
    };

    bdService
        .collection('pensamiento_score')
        .doc(IdUsuario)
        .set(score)
        .then((value) => {print('DocumentSnapshot successfully written!')})
        .catchError((error) => {print('Error writing document: $error')});
  }
}

class PensamientoLibrary {
  static String getImagen(String imgNombre) {
    switch (imgNombre.trim().toUpperCase()) {
      case "PENS01":
        return "assets/img/ic_m56.png";
      case "PENS02":
        return "assets/img/ic_m57.png";
      case "PENS03":
        return "assets/img/ic_m58.png";
      case "PENS04":
        return "assets/img/ic_m59.png";
      case "PENS05":
        return "assets/img/ic_m60.png";
      case "PENS06":
        return "assets/img/ic_m61.png";
      case "PENS07":
        return "assets/img/ic_m62.png";
      case "PENS08":
        return "assets/img/ic_m63.png";
      case "PENS09":
        return "assets/img/ic_m64.png";
      case "PENS10":
        return "assets/img/ic_m65.png";
      default:
        return "assets/img/ic_pensamiento.png";
    }
  }

  static String getIndicaciones(String strNombre) {
    switch (strNombre.trim().toUpperCase()) {
      case "PENS01":
        return "Los planetas son redondos.\nJupiter es un planeta.";
      case "PENS02":
        return "Aristóteles era filósofo.\nTodo filósofo es griego.";
      case "PENS03":
        return "Los vehículos deportivos son costosos.\nEl nuevo Ferrari es costoso.";
      case "PENS04":
        return "Todos los hombres respiran.\nNinguna mujer respira.";
      case "PENS05":
        return "Ninguna persona respira dentro de un líquido.\nEl agua es un líquido.";
      case "PENS06":
        return "Las vacas son mamíferos.\nLas vacas son murciélagos.";
      case "PENS07":
        return "Algunos asteroides son de hierro.\nAlgunos asteroides son magnéticos.";
      case "PENS08":
        return "Todos los lunes llego tarde al trabajo.\nNo voy más los lunes al trabajo.";
      case "PENS09":
        return "Todas las flores tienen perfume.\nTodas las rosas tienen perfume.";
      case "PENS10":
        return "Algunos reptiles tienen patas.\nAlgunos reptiles son perros.";
      default:
        return "Ha culminado el modulo.";
    }
  }
}
