import 'package:flutter/material.dart';

import 'helpers_widget.dart';

class PensamientoPage extends StatelessWidget {
  const PensamientoPage({super.key});

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
