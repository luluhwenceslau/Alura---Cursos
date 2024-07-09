import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const Alubank());
}

class Alubank extends StatelessWidget{
  const Alubank({super.key});

  @override
 Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Alubank',
      home: Home(),
    );
  }
}