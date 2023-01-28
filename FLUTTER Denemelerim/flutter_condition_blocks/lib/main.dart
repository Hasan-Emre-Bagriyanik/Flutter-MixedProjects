import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Şart Blokları"),
        ),
        body: const Center(
          child: ElevatedButton(
            child: Text("Sınav sonucunu getir"),
            onPressed: () {
              var alert = AlertDialog(
                title: Text("kjfdjdlsznxckl"),
              );
            },
          ),
        ),
      ),
    ),
  );
}
