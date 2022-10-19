import 'package:flutter/material.dart';
import 'home.dart';

class MyLogin extends StatefulWidget {
  MyLogin({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: new Scaffold(
        body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TextField(
                style: new TextStyle(
                    fontSize: 12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),
              new TextField(
                style: new TextStyle(
                    fontSize: 12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),
              new ElevatedButton(
                  key: null,
                  onPressed: buttonPressed,
                  child: new Text(
                    "LOGIN",
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  )),
              new ElevatedButton(
                  key: null,
                  onPressed: buttonPressed2,
                  child: new Text(
                    "REGISTER",
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  ))
            ]),
      ),
    );
  }

  void buttonPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  void buttonPressed2() {}
}
