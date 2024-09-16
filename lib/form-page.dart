import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice/profile-view.dart';
import 'package:flutter_practice/widgets/form-section.dart';
import 'package:flutter_practice/widgets/submit-boton.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String name = '';
  String lastname = '';
  int number = 0;
  String address = '';
  String email = '';
  String password = '';
  File? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basic App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Formulario",
                style: TextStyle(fontSize: 30),
              ),
              FormSection(
                getName: (value) {
                  setState(() {
                    name = value;
                  });
                }, 
                getLastName: (value) {
                  setState(() {
                    lastname = value;
                  });
                }, 
                getNumber: (value) {
                  setState(() {
                    number = int.parse(value);
                  });
                }, 
                getAddress: (value) {
                  setState(() {
                    address = value;
                  });
                }, 
                getEmail: (value) {
                  setState(() {
                    email = value;
                  });
                }, 
                getPassword: (value) {
                  setState(() {
                    password = value;
                  });
                }, 
                getProfile: (file) {
                  setState(() {
                    profile = file;
                  });
                }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SubmitButton(
                  onPressed: () {
                    final user = User(
                        name: name,
                        lastname: lastname,
                        number: number,
                        address: address,
                        email: email,
                        password: password,
                        profile: profile);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileView(user: user)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String lastname;
  final int number;
  final String address;
  final String email;
  final String password;
  final File? profile;
  User(
      {required this.name,
      required this.lastname,
      required this.number,
      required this.address,
      required this.email,
      required this.password,
      required this.profile});
}
