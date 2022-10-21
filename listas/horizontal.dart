import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const titulo = 'lista de numeros';
    return MaterialApp(
      title: titulo,
      home: Scaffold(
          appBar: AppBar(title: const Text(titulo)),
          body: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.pink,
              ),
              Container(
                width: 160.0,
                color: Colors.brown,
              ),
            ],
          )),
    );
  }
}
