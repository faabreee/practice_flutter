import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice/form-page.dart';
import 'package:flutter_practice/widgets/data-profile.dart';

class ProfileView extends StatefulWidget {
  final User user;

  const ProfileView({super.key, required this.user});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //  Center(
            //   child: Image.file((user.profile != null && 
            //   File(user.profile as String).existsSync() 
            //   ? Image.file(File(user.profile as String),
            //       width: 300, height: 300, fit: BoxFit.cover,)
            //       : const Text (
            //            'Sin imagen',
            //            style: TextStyle(fontSize: 18),
            //       )) as File,
            // )),
            Center(
              child: Image.file(user.profile!,
                  width: 300, height: 300, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                DataProfile(name: 'Nombre : ', valor: user.name),
                DataProfile(name: 'Apellido : ', valor: user.lastname),
                DataProfile(
                    name: 'Telefono : ', valor: user.number.toString()),
                DataProfile(name: 'Direccion : ', valor: user.address),
                DataProfile(name: 'Email : ', valor: user.email),
                DataProfile(name: 'Contraseña : ', valor: user.password)
              ],
            )
          ],
        ),
      ),
    );
  }
}
