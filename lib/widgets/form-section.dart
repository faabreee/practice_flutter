import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice/widgets/image-picker.dart';
import 'package:flutter_practice/widgets/input-form.dart';

class FormSection extends StatelessWidget {
  //CallBacks, Closure
  final ValueChanged<String> getName;
  final ValueChanged<String> getLastName;
  final ValueChanged<String> getNumber;
  final ValueChanged<String> getAddress;
  final ValueChanged<String> getEmail;
  final ValueChanged<String> getPassword;
  final ValueChanged<File?> getProfile;

  const FormSection({
    Key? key,
    required this.getName,
    required this.getLastName,
    required this.getNumber,
    required this.getAddress,
    required this.getEmail,
    required this.getPassword,
    required this.getProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputForm(
            title: "Nombre", icon: const Icon(Icons.person), method: getName),
        InputForm(
          title: "hola",
          icon: const Icon(Icons.abc_sharp),
          method: (value) {},
        ),
        InputForm(
            title: "Apellido",
            icon: const Icon(Icons.person_2_outlined),
            method: getLastName),
        InputForm(
            title: "Telefono",
            icon: const Icon(
              Icons.phone_android,
            ),
            method: getNumber),
        InputForm(
            title: "Ubicacion",
            icon: const Icon(
              Icons.directions,
            ),
            method: getAddress),
        InputForm(
            title: "Email", icon: const Icon(Icons.email), method: getEmail),
        InputForm(
            title: "Contraseña",
            icon: const Icon(Icons.password),
            method: getPassword),
        ImagePickerWidget(onImagePicked: getProfile)
      ],
    );
  }
}
