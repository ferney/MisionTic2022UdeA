import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    final email = TextField(
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "E-Mail",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );

    final contrasena = TextField(
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );

    final login = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final registro = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Registro",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.network(
                    'https://acortar.link/YS8cg2',
                    fit: BoxFit.contain,
                  ),
                  /*
                  child: Image.assets(
                    'assets/icono.png',
                    fit: BoxFit.contain,
                  ),
                  */
                ),
                SizedBox(height: 20),
                email,
                SizedBox(height: 20),
                contrasena,
                SizedBox(height: 20),
                login,
                SizedBox(height: 20),
                registro,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
