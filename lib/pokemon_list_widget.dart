import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../services/api_retrofit.dart';
import '../clases/pokemon_model.dart';

class PokemonListWidget extends StatefulWidget {
  @override
  _PokemonListWidgetState createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  late ApiRetrofit apiRetrofit;
  PokemonCharacter? pokemon;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    apiRetrofit = ApiRetrofit(dio);
    fetchPokemon();
  }

  Future<void> fetchPokemon() async {
    try {
      final result = await apiRetrofit.getPokemon(1);
      setState(() {
        pokemon = result;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokémon")),
      body: pokemon != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ID:${pokemon!.id}"),
                  Text("Nombre:${pokemon!.name}"),
                  Text("Altura:${pokemon!.height}"),
                  Text("Peso:${pokemon!.weight}"),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
