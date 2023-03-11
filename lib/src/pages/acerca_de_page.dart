import 'package:flutter/material.dart';
import 'package:proyecto_dam_p2/src/pages/helpers_widget.dart';

class AcercaDePage extends StatelessWidget {
  const AcercaDePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarra(context, 'Acerca de ¨Mental Games¨', true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Flex(
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: Axis.vertical,
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/img/ic_uglogo.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Image.asset(
                        'assets/img/ic_softlogo.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
                SizedBox(width: 16),
                Text(
                  'Desarrollo de Aplicaciones Móviles',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'SOFT-S-NO-8-6',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  'M.Sc. Charco A. Jorge Luis',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Integrantes del Grupo 7',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Edgar C. Basurto',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  'Espinoza de los Monteros Víctor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  'Gutiérrez L. Dennis',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  'Larrea B. Edwin',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Acerca de los Módulos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/img/ic_aprendizaje.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      //flex: 2,
                      child: Text(
                        'Actividades enfocadas a adquirir o modificar sus habilidades, destrezas, conocimientos o conductas como fruto de la experiencia directa, el razonamiento o la instrucción.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/img/ic_atencion.png'),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Actividades enfocadas a mejorar y mantener la capacidad de concentración.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/img/ic_percepcion.png'),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Actividades que estimulan la capacidad para identificar los objetos del entorno.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/img/ic_pensamiento.png'),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Actividades enfocadas al razonamiento y juicio lógico en el que se establecen relaciones racionales entre elementos concretos y/o abstractos.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            )
          ],
        ),
      ),
    );
  }
}
