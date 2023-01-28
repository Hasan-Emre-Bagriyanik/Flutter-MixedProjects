import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Costum Widget",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Menü"),
          ),
          body: Body(),
        ));
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.lightGreen,
      child: Text(
        "Uygulama Gövdesi",
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
    );
  }
}
