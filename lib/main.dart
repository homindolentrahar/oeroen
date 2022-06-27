import 'package:flutter/material.dart';

void main() {
  runApp(const OeroenApp());
}

class OeroenApp extends StatelessWidget {
  const OeroenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Oeroen',
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Oeroen"),
          ),
        ),
      ),
    );
  }
}
