import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(color: Colors.red, width: 200, height: 200),
                Container(color: Colors.lightBlue, width: 100, height: 100,),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(color: Colors.lightBlue, width: 200, height: 200),
                Container(color: Colors.red, width: 100, height: 100,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(color: Colors.deepPurpleAccent, height: 50, width: 50),
                Container(color: Colors.purple, height: 50, width: 50),
                Container(color: Colors.purpleAccent, height: 50, width: 50),
              ],
            ),
            Container(color: Colors.amber, height: 30, width: 300,
              child: const Text(
                'Olá Mundo!',
                style: TextStyle(color: Colors.black, fontSize: 28,),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(onPressed:(){
              },
                child: const Text('Aperte o Botão!'),)
          ],
        ),
      ),
    );
  }
}


