import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practice/form-page.dart';

class ButtonHome extends StatelessWidget {
  final String nombre;
  final Widget route;

  const ButtonHome({super.key, required this.nombre, required this.route});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => route));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black38)),
          child: Text(
            nombre,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
