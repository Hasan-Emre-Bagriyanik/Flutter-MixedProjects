/*import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text("Hello Hasan Emre"),
    ),
    body: Center(child: Text("Here is the body of the app")),
  )));
}*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Application title",
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Application"),
        backgroundColor: Colors.red,
      ),
      // ignore: prefer_const_constructors
      body: Material(
        color: Colors.lightBlueAccent,
        child: const Center(
            // ignore: unnecessary_const
            child: const Text(
          "Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 40.0,
          ),
        )),
      ),
    ),
  ));
}
