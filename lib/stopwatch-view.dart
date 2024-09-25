import 'dart:async';
import 'dart:developer';
import 'dart:ffi';


import 'package:flutter/material.dart';

class StopWatchView extends StatefulWidget {
  const StopWatchView({super.key});

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  Timer? _timer;
  int contador = 0;
  bool running = false;

  void cronometro() {
    if (!running) {
      running = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          contador = contador + 1;
          log("Resultadooo ---------------> ${contador}");
        });
      });
    }
  }

  void detener() {
    if (running) {
      _timer?.cancel();
      running = false;
    }
  }

  void reiniciar() {
    detener();
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cronometro"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${contador}",
              style: TextStyle(fontSize: 70),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: cronometro, child: Icon(Icons.play_arrow)),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(onPressed: detener, child: Icon(Icons.pause)),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(onPressed: reiniciar, child: Icon(Icons.stop)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
