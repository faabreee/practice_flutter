import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_practice/services/pokemon-service.dart';
import 'package:flutter_practice/clases/pokemon.dart';

class ApiView extends StatefulWidget {
  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  
  late Future<List<Pokemon>> futurePokemonList;

  @override
  void initState() {
    super.initState();
    futurePokemonList = getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pokemon'),
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: futurePokemonList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final pokemon = snapshot.data![index];
                  return ListTile(
                    leading: Image.network(
                      pokemon.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(pokemon.name),
                    onTap: () {
                      log("Tapped on ${pokemon.name}");
                    },
                  );
                },
              );
            } else {
              return const Text('No se encontraron datos');
            }
          },
        ),
      ),
    );
  }
}