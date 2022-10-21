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
        body: new GridView.count(
            crossAxisCount: 2,
            children: List.generate(100, (index) {
              return Center(
                  child: Text(
                'Item N° $index',
                style: Theme.of(context).textTheme.headline5,
              ));
            })),
      ),
    );
  }
}
