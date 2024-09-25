import 'package:flutter/material.dart';

class DualActionView extends StatefulWidget {
  const DualActionView({super.key});

  @override
  State<DualActionView> createState() => _DualActionViewState();
}

class _DualActionViewState extends State<DualActionView> {
  String _resultadoMetodo1 = "Esperando...";
  String _resultadoMetodo2 = "Esperando...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejecución Simultánea de Métodos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Resultado Método 1: $_resultadoMetodo1',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado Método 2: $_resultadoMetodo2',
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
    // Ejecutar el segundo método con un callback antes del primero
    metodo2ConCallback((valorEmitido) {
      setState(() {
        _resultadoMetodo2 = valorEmitido;  // Actualizar la vista cuando se reciba el valor
      });
    });

    // Ejecutar el primer método de forma asíncrona
    metodo1();
  }

  // Método 1: toma 5 segundos en completarse (simula una tarea larga)
  Future<void> metodo1() async {
    await Future.delayed(Duration(seconds: 5)); // Simula una tarea que toma tiempo
    setState(() {
      _resultadoMetodo1 = "Success";  // Actualizar cuando termine
    });
  }

  // Método 2: emite un valor usando un callback antes de que termine el método 1
  void metodo2ConCallback(Function(String) callback) {
    Future.delayed(Duration(seconds: 1), () {
      callback("Success");  // Llama al callback después de 1 segundo
    });
  }
}