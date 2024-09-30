import 'package:flutter/material.dart';
import 'package:flutter_practice/api-view.dart';
import 'package:flutter_practice/pokemon_list_widget.dart';
import 'package:flutter_practice/dualaction-view.dart';
import 'package:flutter_practice/form-page.dart';
import 'package:flutter_practice/location-client.dart';
import 'package:flutter_practice/map-view.dart';
import 'package:flutter_practice/stopwatch-view.dart';
import 'package:flutter_practice/widgets/buton-home.dart';
import 'package:flutter_practice/widgets/minio-view.dart';
// import 'package:flutter_practice/widgets/map-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ButtonHome(nombre: "Formulario", route: FormPage()),
              ButtonHome(nombre: "Consumir libreria de Google Maps", route: MapView()),
              ButtonHome(nombre: "Consumo de api", route: ApiView()),
              ButtonHome(nombre: "JsonPlaceholder Api", route: MinioView()),

              ButtonHome(nombre: "Cliente Localizador", route: LocationClientView()),
              ButtonHome(nombre: "Action Dual", route: DualActionView()),
              ButtonHome(nombre: "Cronometro", route: StopWatchView()),
              ButtonHome(nombre: "ApiRetrofit", route: PokemonListWidget()),
            ],
          ),
        ),
      )
    );
  }
}

