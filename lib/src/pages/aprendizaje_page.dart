import 'package:flutter/material.dart';

class AprendizajePage extends StatelessWidget {
  const AprendizajePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprendizaje'),
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
