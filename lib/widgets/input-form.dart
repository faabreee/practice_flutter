import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.title,
    required this.icon,
    required this.method,
  });

  final String title;
  final Icon icon;
  final ValueChanged<String> method;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        icon: icon,
      ),
      onChanged: method,
    );
  }
}