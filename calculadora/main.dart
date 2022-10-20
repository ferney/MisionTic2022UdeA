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
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num1 = 0, num2 = 0, respuesta = 0;

  final TextEditingController PrimerNumero = TextEditingController(text: '');
  final TextEditingController SegundoNumero = TextEditingController(text: '');

  bool checkNumber() {
    try {
      num1 = int.parse(PrimerNumero.text);
      num2 = int.parse(SegundoNumero.text);
      return true;
    } on FormatException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('datos de ingreso invalidos'),
      ));

      setState(() {
        respuesta = 0;
      });
      return false;
    }
  }

  void suma() {
    if (checkNumber())
      setState(() {
        respuesta = num1 + num2;
      });
  }

  void resta() {
    if (checkNumber())
      setState(() {
        respuesta = num1 - num2;
      });
  }

  void multiplicacion() {
    if (checkNumber())
      setState(() {
        respuesta = num1 * num2;
      });
  }

  void divicion() {
    if (checkNumber())
      setState(() {
        try {
          respuesta = num1 ~/ num2;
        } catch (_) {
          respuesta = 0;
        }
      });
  }

  void limpiar() {
    if (checkNumber())
      setState(() {
        PrimerNumero.text = "";
        SegundoNumero.text = "";
        respuesta = 0;
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese un número',
                ),
                controller: PrimerNumero,
                style: new TextStyle(
                    fontSize: 12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese un número',
                ),
                controller: SegundoNumero,
                style: new TextStyle(
                    fontSize: 12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),
              ElevatedButton(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onPressed: suma,
              ),
              ElevatedButton(
                child: Text(
                  "-",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onPressed: resta,
              ),
              ElevatedButton(
                child: Text(
                  "x",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onPressed: multiplicacion,
              ),
              ElevatedButton(
                child: Text(
                  "/",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onPressed: divicion,
              ),
              ElevatedButton(
                child: Text(
                  "Limpiar",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onPressed: limpiar,
              ),
              new Text(
                "Respuesta $respuesta",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ]),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),
    );
  }
}
