import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';


import 'home.dart';
import 'model.dart';

Future main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  await Hive.openBox<Item>('itemBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Hive_CRUD(),
    );
  }
}
