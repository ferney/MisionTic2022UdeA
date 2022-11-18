import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reversi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  String _reversed = '';
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Reversi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter string to reverse"),
            ),
            const SizedBox(height: 10.0),
            if (_reversed != '') ...[
              Text(
                _reversed,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
            ElevatedButton(
              child: const Text("Reverse"),
              onPressed: () {
                if (_controller.text.isEmpty) return;
                setState(() {
                  _reversed = reverseString(_controller.text);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

String reverseString(String initial) {
  return initial.split('').reversed.join();
}
