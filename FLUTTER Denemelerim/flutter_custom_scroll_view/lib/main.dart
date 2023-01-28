import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'customScrollViewWidget.dart';

void main() {
  runApp(MaterialApp(
    title: "Liste Çeşitleri",
    home: Scaffold(
      body: customScrollViewWidget(),
    ),
  ));
}
