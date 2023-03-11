import 'package:flutter/material.dart';

class PercepcionPage extends StatelessWidget {
  const PercepcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percepcion'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
        ),
      ),
      body: Center(
        child: Text(
          'Contenido',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
