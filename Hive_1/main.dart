import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox<String>('xyz');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<String> xyzBox;
  final _idController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    xyzBox = Hive.box<String>('xyz');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hive noSQL'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Center(
            child: ValueListenableBuilder(
                valueListenable: xyzBox.listenable(),
                builder: (context, Box<String> xyz, _) {
                  return ListView.separated(
                      itemCount: xyz.keys.length,
                      separatorBuilder: (_, i) => const Divider(),
                      itemBuilder: (ctx, i) {
                        final key = xyz.keys.toList()[i];
                        final valor = xyz.get(key);
                        return ListTile(
                          title: Text(key),
                          subtitle: Text(valor.toString()),
                        );
                      });
                }),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //insertar datos
              ElevatedButton(
                  child: const Text('insertar'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            child: SizedBox(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: const InputDecoration(
                                          label: Text('llave')),
                                      controller: _idController,
                                    ),
                                    TextField(
                                      decoration: const InputDecoration(
                                          label: Text('valor')),
                                      controller: _nameController,
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    ElevatedButton(
                                        child: const Text('guardar'),
                                        onPressed: () {
                                          final key = _idController.text;
                                          final value = _nameController.text;
                                          xyzBox.put(key, value);
                                          _idController.clear();
                                          _nameController.clear();
                                        })
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }),

              //actualizar datos
              ElevatedButton(
                  child: const Text('actualizar'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            child: SizedBox(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: const InputDecoration(
                                          label: Text('llave')),
                                      controller: _idController,
                                    ),
                                    TextField(
                                      decoration: const InputDecoration(
                                          label: Text('valor')),
                                      controller: _nameController,
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    ElevatedButton(
                                        child: const Text('guardar'),
                                        onPressed: () {
                                          final key = _idController.text;
                                          final value = _nameController.text;
                                          xyzBox.put(key, value);
                                          _idController.clear();
                                          _nameController.clear();
                                        })
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }),
              //eliminar datos

              ElevatedButton(
                  child: const Text('eliminar'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            child: SizedBox(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: const InputDecoration(
                                          label: Text('llave')),
                                      controller: _idController,
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    ElevatedButton(
                                        child: const Text('guardar'),
                                        onPressed: () {
                                          final key = _idController.text;
                                          xyzBox.delete(key);
                                          _idController.clear();
                                        })
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }),
            ],
          )
        ],
      )),
    );
  }
}

/*
dependencies:
  flutter:
    sdk: flutter  
  cupertino_icons: ^1.0.2
  hive: ^2.0.4
  hive_flutter: ^1.1.0
  path_provider: ^2.0.7

dev_dependencies:
  flutter_test:
    sdk: flutter  
  flutter_lints: ^1.0.0
  build_runner: ^1.12.2
  hive_generator: ^1.0.1
  */
