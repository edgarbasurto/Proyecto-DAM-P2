import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_dam_p2/src/bloc/provider.dart';

import 'helpers_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBarra(context, "", false),
      body: Stack(
        children: <Widget>[dashBg, content(context)],
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.lightBlue),
            flex: 2,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 5,
          ),
        ],
      );

  Container content(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[header, grid(context), SalirBoton(context)],
      ),
    );
  }

  get header => Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/img/mentalgame_icono.png',
                        color: Colors.white, width: 90.0),
                    SizedBox(height: 10.0, width: double.infinity),
                  ],
                ),
              ),
              Text(
                'BIENVENIDO',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '10 items',
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              // trailing: CircleAvatar(),],
            ]),
      );

  Expanded grid(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 20),
        child: GridView.count(
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: .90,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'aprendizaje');
              },
              child: btnMenu('assets/img/ic_aprendizaje.png', 'Aprendizaje'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'atencion');
              },
              child: btnMenu('assets/img/ic_atencion.png', 'Atención'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'percepcion');
              },
              child: btnMenu('assets/img/ic_percepcion.png', 'Percepción'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'pensamiento');
              },
              child: btnMenu('assets/img/ic_pensamiento.png', 'Pensamiento'),
            ),
          ],
        ),
      ),
    );
  }

  Card btnMenu(String img, String label) {
    return new Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            img,
            height: 120,
            width: 120,
          ),
          Container(
            child: Text(label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 19, 30, 97),
                  fontSize: 15,
                )),
            margin: EdgeInsets.only(top: 15),
          ),
        ],
      )),
    );
  }
}



 // return Scaffold(
  //   appBar: AppBarra(context, ""),
  //   body: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Spacer(),
  //       Text('Email: ${bloc.email}'),
  //       SizedBox(height: 30.0),
  //       //Divider(),
  //       Expanded(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             GestureDetector(
  //               onTap: () {
  //                 Navigator.pushReplacementNamed(context, 'aprendizaje');
  //               },
  //               child: Card(
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       'assets/img/ic_aprendizaje.png',
  //                       height: 120,
  //                       width: 120,
  //                     ),
  //                     Text(
  //                       'Aprendizaje.',
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 Navigator.pushReplacementNamed(context, 'atencion');
  //               },
  //               child: Card(
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       ,
  //                       height: 120,
  //                       width: 120,
  //                     ),
  //                     Text(
  //                       'Atención.',
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Expanded(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             GestureDetector(
  //               onTap: () {
  //                 Navigator.pushReplacementNamed(context, '');
  //               },
  //               child: Card(
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       'assets/img/ic_percepcion.png',
  //                       height: 120,
  //                       width: 120,
  //                     ),
  //                     Text(
  //                       'Percepción.',
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 Navigator.pushReplacementNamed(context, '');
  //               },
  //               child: Card(
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       'assets/img/ic_pensamiento.png',
  //                       height: 120,
  //                       width: 120,
  //                     ),
  //                     Text(
  //                       'Pensamiento.',
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Spacer(),
  //       _SalirBoton(bloc, context),
  //     ],
  //   ),
  // );