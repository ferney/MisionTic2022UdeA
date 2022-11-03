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
        appBar: new AppBar(
          title: new Text('principal'),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Detalles();
            }));
          },
          child: Center(
              child:
                  Image.network('https://img.icons8.com/ios/452/flutter.png')),
        ));
  }
}

class Detalles extends StatelessWidget {
  Detalles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('secundaria'),
        ),
        body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Image.network(
                  'https://img.icons8.com/color/344/android-studio--v2.png'),
            )));
  }
}
