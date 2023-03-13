import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:proyecto_dam_p2/src/data/percepcion_data.dart';
import 'package:proyecto_dam_p2/src/pages/helpers_widget.dart';

import 'package:proyecto_dam_p2/src/models/precepcion_model.dart';

class PercepcionPage extends StatelessWidget {
  const PercepcionPage({super.key});
  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of(context);

    return Scaffold(
        appBar: AppBarra(context, "", true),
        body: const Percepcion() //documento principal del diseño
        );
  }
}

class Percepcion extends StatefulWidget {
  const Percepcion({super.key});
  @override
  _PercepcionState createState() => _PercepcionState();
}

class _PercepcionState extends State<Percepcion> {
  PercepcionModel pregunta = PercepcionModel();
  FirebaseFirestore bdService = FirebaseFirestore.instance;

  //region variables para Timer
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];
  //endregion

  //region variables para score
  String idUsuario = 'aUO0tmfL2oWdysYkq6Uaa2wVYas2';
  bool mostrarwaitingBar = true;
  int scoreActual = 0;
  int totalJuegos = 0;
  //endregion

  @override
  void initState() {
    initPregunta();
    super.initState();

//Se optiene valores de usuario para la session del activity
    // FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
    // if (user != null) {
    //   IdUsuario = user.getUid();
    // }

    mostrarwaitingBar = true;
    totalJuegos = 0;
    scoreActual = 0;
    cargarScoreUsuario();

    buscarPregunta();
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
      children: !mostrarwaitingBar
          ? <Widget>[
              cuerpo(),
              chronometer(),
              intentos(),
              score(),
              SalirBoton(context)
            ]
          : <Widget>[progressIndicator()],
    );
  }

  Column progressIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 200),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    semanticsLabel: percepStrindicaFound.toString(),
                  )
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(percepStrindicaFound.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontFamily: "sans-serif-medium"))
                  ])
            ],
          ),
        ),
        SalirBoton(context),
      ],
    );
  }

  Column cuerpo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        imagenTop(),
        indicaciones(),
        respuestas(),
      ],
    );
  }

  Container imagenTop() {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 130,
      child: Image.asset(getImagen(pregunta.imagen),
          width: pregunta.imagenHeight, height: pregunta.imagenHeight),
    );
  }

  Container indicaciones() {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
            widthFactor: 50,
            child: Text(
              getIndicaciones(pregunta.getIndicaciones),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: "sans-serif-medium"),
            )));
  }

  Container score() {
    return Container(
        margin: const EdgeInsets.all(5),
        child: Text(
          "Puntaje: $scoreActual",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: "sans-serif-medium"),
        ));
  }

  Container intentos() {
    return Container(
        margin: const EdgeInsets.all(5),
        child: Text(
          "Intento # ${pregunta.intentos}",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: "sans-serif-medium"),
        ));
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

  Column respuestas() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GridView(
              shrinkWrap: true,
              //physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 130.0,
              ),
              children: List.generate(pregunta.imgParam.length, (index) {
                return imgOpcion(
                    pregunta.imgParam[index].id,
                    getImagen(pregunta.imagen),
                    pregunta.imgParam[index].width,
                    pregunta.imgParam[index].height);
              }))
        ]);
  }

  Row linea1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        imgOpcion('IMGOPC1', getImagen(""), 90, 90),
        imgOpcion('IMGOPC2', getImagen(""), 40, 40),
      ],
    );
  }

  GestureDetector imgOpcion(
      String id, String img, double imgWidth, double imgHeight) {
    return GestureDetector(
        onTap: () {
          clickOpcion(id);
        },
        child: Container(
            margin: const EdgeInsets.all(10),
            width: 130,
            height: 130,
            child: Center(
                child: SizedBox(
                    width: imgWidth,
                    height: imgHeight,
                    child: Image.asset(
                      img,
                    )))));
  }

  void clickOpcion(String idImagen) {
    if (idImagen.trim().toUpperCase() == pregunta.repuesta) {
      cronometroreset();
      mostrarwaitingBar = true;
      // guardarProgreso();
      //actualizarScoreUsuario();
      notificar("Correcto!");
      buscarPregunta();
    } else {
      notificar("Intento # ${pregunta.intentos} incorrecto!");
      pregunta.intentos++;
    }
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

  void cronometroaddLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
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

  //region Preguntas
  void initPregunta() {
    List<PercepcionImgParamModel> _imgParam = <PercepcionImgParamModel>[];
    _imgParam.add(const PercepcionImgParamModel("IMGOPC1", 0, 0));
    _imgParam.add(const PercepcionImgParamModel("IMGOPC2", 0, 0));
    _imgParam.add(const PercepcionImgParamModel("IMGOPC3", 0, 0));
    _imgParam.add(const PercepcionImgParamModel("IMGOPC4", 0, 0));
    _imgParam.add(const PercepcionImgParamModel("IMGOPC5", 0, 0));
    _imgParam.add(const PercepcionImgParamModel("IMGOPC6", 0, 0));

    pregunta.idJuego = "";
    pregunta.indicaciones = "";
    pregunta.intentos = 1;
    pregunta.imagen = "";
    pregunta.imgParam = _imgParam;
  }

  void buscarPregunta() {
    if (totalJuegos > MAXPREGUNTAS) {
      initPregunta();
    } else {
      //Se busca un juego al azar
      Random rand = Random();
      int intId = rand.nextInt(MAXPREGUNTAS);
      //para no empezar en 0
      intId++;
      String tmpPregunta = "Q$intId";

      //Crga en memoria la coleccion
      final logUsuario = bdService
          .collection("percepcion_score")
          .doc(idUsuario)
          .collection("logs");

      // Consulta, se verifica si el juego ya fue realizado.
      final query = logUsuario.where("idjuego", isEqualTo: tmpPregunta);

      query.get().then(
        (QuerySnapshot doc) {
          int rows = doc.docs.length;
          if (rows == 0) {
            cargarPregunta(tmpPregunta);
          } else {
            buscarPregunta();
          }
        },
        onError: (e) => notificar("Error getting document: $e"),
      );
    }
  }

  void cargarPregunta(String juego) {
    initPregunta();
    pregunta.idJuego = juego;
    final firebasePregunta =
        bdService.collection("percepcion_questions").doc(juego);

    firebasePregunta.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        pregunta.indicaciones = data["indicaciones"].trim().toUpperCase();
        pregunta.repuesta = data["respuesta"].trim().toUpperCase();
        pregunta.imagen = data["ImgBase"];
        pregunta.imagenHeight = doubleParseint(data["ImgBaseHeight"]);

        List<PercepcionImgParamModel> _imgParam = <PercepcionImgParamModel>[];
        _imgParam.add(PercepcionImgParamModel("IMGOPC1",
            doubleParseint(data["ImgOpc1"]), doubleParseint(data["ImgOpc1"])));
        _imgParam.add(PercepcionImgParamModel("IMGOPC2",
            doubleParseint(data["ImgOpc2"]), doubleParseint(data["ImgOpc2"])));
        _imgParam.add(PercepcionImgParamModel("IMGOPC3",
            doubleParseint(data["ImgOpc3"]), doubleParseint(data["ImgOpc3"])));
        _imgParam.add(PercepcionImgParamModel("IMGOPC4",
            doubleParseint(data["ImgOpc4"]), doubleParseint(data["ImgOpc4"])));
        _imgParam.add(PercepcionImgParamModel("IMGOPC5",
            doubleParseint(data["ImgOpc5"]), doubleParseint(data["ImgOpc5"])));
        _imgParam.add(PercepcionImgParamModel("IMGOPC6",
            doubleParseint(data["ImgOpc6"]), doubleParseint(data["ImgOpc6"])));
        pregunta.imgParam = _imgParam;
        cronometrostart();
        mostrarwaitingBar = false;
      },
      onError: (e) => notificar("Error getting document: $e"),
    );
  }

  void cargarScoreUsuario() {
    final firebasePregunta =
        bdService.collection("percepcion_score").doc(idUsuario);

    firebasePregunta.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        if (data == null || data.isEmpty) {
          totalJuegos = 0;
          scoreActual = 100;
        } else {
          totalJuegos = data["total_juegos"];
          scoreActual = data["tasa_exito"];
        }
      },
      onError: (e) => notificar("Error getting document: $e"),
    );
  }
}
