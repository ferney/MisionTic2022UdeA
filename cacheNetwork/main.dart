import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const titulo = 'imagenes en caché';
    return MaterialApp(
      title: titulo,
      home: Scaffold(
        appBar: AppBar(title: const Text(titulo)),
        body: Center(
          child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: 'https://acortar.link/dB1p03',
          ),
        ),
      ),
    );
  }
}
