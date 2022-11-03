import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('principal'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('abrir rurta'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Detalles()));
            },
          ),
        ));
  }
}

class Detalles extends StatelessWidget {
  Detalles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('secundaria'),
      ),
      body: Center(
          child: ElevatedButton(
              child: const Text('back'),
              onPressed: () {
                Navigator.pop(context);
              })),
    );
  }
}
