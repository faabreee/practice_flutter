import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_practice/clases/form_data.dart';
import 'package:flutter_practice/home-page.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FormData formData = FormData(name: '', email: '', password: '');

  String emailval = 'admin@admin.com';
  String passwordval = '123456';

  late bool errorAutentication = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // TextFormField(
              //   initialValue: formData.name,
              //   decoration: InputDecoration(labelText: 'Nombre'),
              //   onChanged: (value) {
              //     setState(() {
              //       formData = formData.copyWith(name: value);
              //     });
              //   },
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Por favor ingrese su nombre';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                initialValue: formData.email,
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    formData = formData.copyWith(email: value);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor ingrese un email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: formData.password,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    formData = formData.copyWith(password: value);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una contraseña';
                  } else if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    print('Formulario válido: ${formData}');

                    if (formData.email == emailval && formData.password == passwordval){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    }else{
                        errorAutentication = true;
                    }
                    print('form: ${formData.email} y val: ${emailval}');
                  }
                },
                child: Text('Enviar'),
              ),
              SizedBox(height: 20,),
              Text(
                errorAutentication ? 'Error, email ${formData.email} y/o contraseña ${formData.password} incorrectos' : ''
              )
            ],
          ),
        ),
      ),
    );
  }
}