import 'package:flutter/material.dart';

class LocationClientView extends StatefulWidget {
  const LocationClientView({super.key});

  @override
  State<LocationClientView> createState() => _LocationClientViewState();
}

class _LocationClientViewState extends State<LocationClientView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Holaaa")),
    );
  }
}