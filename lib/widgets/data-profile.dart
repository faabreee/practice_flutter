import 'package:flutter/material.dart';

class DataProfile extends StatelessWidget {
  const DataProfile({super.key, required this.valor, required this.name});

  final String name;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          valor,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
