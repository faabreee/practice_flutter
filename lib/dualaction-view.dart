import 'package:flutter/material.dart';

class DualActionView extends StatefulWidget {
  const DualActionView({super.key});

  @override
  State<DualActionView> createState() => _DualActionViewState();
}

class _DualActionViewState extends State<DualActionView> {
  String _resultadoFuncion2 = "";
  String _resultadoFuncion3 = "";

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
              'Resultado Método 1: $_resultadoFuncion2',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado Método 2: $_resultadoFuncion3',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
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
    primeraFuncion((valorEmitido) {
      setState(() {
        _resultadoFuncion3 = valorEmitido;
      });
    });

    segundaFuncion();
  }

  Future<void> segundaFuncion() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _resultadoFuncion2 = "Success";
    });
  }

  void primeraFuncion(Function(String) callback) {
    Future.delayed(Duration(seconds: 1), () {
      callback("Success");
    });
  }
}