import 'package:flutter/material.dart';

class DualActionView extends StatefulWidget {
  const DualActionView({super.key});

  @override
  State<DualActionView> createState() => _DualActionViewState();
}

class _DualActionViewState extends State<DualActionView> {
  String resultadoFuncion1 = "";
  String resultadoFuncion2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dual Action'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Resultado Método 1: $resultadoFuncion1',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado Método 2: $resultadoFuncion2',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                ejecutarMetodos();
              },
              child: Text('Boton'),
            ),
          ],
        ),
      ),
    );
  }

  void ejecutarMetodos() {
    primeraFuncion();

    segundaFuncion();
  }

  Future<void> primeraFuncion() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      resultadoFuncion2 = "Completado";
    });
  }
  
  Future<void> segundaFuncion() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      resultadoFuncion1 = "Completado";
    });
  }

}