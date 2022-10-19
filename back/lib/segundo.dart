import 'package:flutter/material.dart';
import 'main.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: new Scaffold(
        body: new Container(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new ElevatedButton(
                    key: null,
                    onPressed: buttonPressed,
                    child: new Text(
                      "BUTTON 5",
                      style: new TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    ))
              ]),
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  void buttonPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MyHomePage(),
    ));
  }
}
