import 'package:flutter/material.dart';
import 'package:proyecto_dam_p2/src/pages/helpers_widget.dart';

class AtencionPage extends StatelessWidget {
  const AtencionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarra(context, "", true),
      body: Center(
          child: Column(children: <Widget>[
        Text(
          'Contenido',
          style: TextStyle(fontSize: 24),
        ),
        SalirBoton(context)
      ])),
    );
  }
}
