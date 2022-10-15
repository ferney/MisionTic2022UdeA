import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({Key? key}) : super(key: key);
  @override
  State<Contador> createState() => _ContadorPantalla();
}

class _ContadorPantalla extends State<Contador> {
  int contador = 0;

  void reset() {
    contador = 0;
    setState(() {});
  }

  void incrementar() {
    contador++;
    setState(() {});
  }

  void decrementar() {
    contador--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const tamano = TextStyle(fontSize: 50);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
        increment: incrementar,
        decrement: decrementar,
        rese: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increment;
  final Function decrement;
  final Function rese;

  const CustomFloatingActions({
    Key? key,
    required this.increment,
    required this.decrement,
    required this.rese,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1_outlined),
            onPressed: () => increment()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () => decrement()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_zero_outlined),
            onPressed: () => rese())
      ],
    );
  }
}
