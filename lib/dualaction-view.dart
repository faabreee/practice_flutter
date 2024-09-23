import 'package:flutter/material.dart';

class DualActionView extends StatefulWidget {
  const DualActionView({super.key});

  @override
  State<DualActionView> createState() => _DualActionViewState();
}

class _DualActionViewState extends State<DualActionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("DualActionView"),
      ),
    );
  }
}