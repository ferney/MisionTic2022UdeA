import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const tamano = TextStyle(fontSize: 50);
    int contador = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('pantalla pricipal'),
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('¿cuantos click realizó?=>', style: tamano),
            Text('$contador', style: tamano)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          contador++;
          print('hola mundo');
        },
      ),
    );
  }
}
