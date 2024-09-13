import 'package:flutter/material.dart';
import 'package:flutter_practice/home-page.dart';
import 'form-page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,       
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}