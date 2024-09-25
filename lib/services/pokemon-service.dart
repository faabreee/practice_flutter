import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_practice/clases/pokemon.dart';

Future<List<Pokemon>> getPokemonList() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20'));
  final List<dynamic> data = json.decode(response.body)['results'];

  return data.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
}
