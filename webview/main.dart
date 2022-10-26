import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
           title: Text('SHOTRAM'),
           backgroundColor: Colors.deepOrangeAccent,
          
         ),

          body: WebView(
            initialUrl: "https://www.tutorialesprogramacionya.com/",
            javascriptMode: JavascriptMode.unrestricted,
          ),


        ),
      ),
    )
  );
}
