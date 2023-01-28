import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gridview/gridview.dart';

void main() {
  var gridViewDemo = GridViewDemo;
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("GridView Kullanımı"),
        backgroundColor: Colors.blueGrey,
      ),
      body: GridViewDemo(),
    ),
  ));
}
