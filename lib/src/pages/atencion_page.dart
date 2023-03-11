import 'package:flutter/material.dart';

class AtencionPage extends StatelessWidget {
  const AtencionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atencion'),
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
