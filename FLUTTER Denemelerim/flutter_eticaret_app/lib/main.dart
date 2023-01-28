import 'package:flutter/material.dart';
import 'package:flutter_eticaret_app/Database/dbHelper.dart';
import 'package:flutter_eticaret_app/Models/Urun.dart';

import 'Ekranlar/UrunListesi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DbHelper dbHelper = new DbHelper();
    dbHelper.dbOlustur().then((database) => null);

    /*Urun urun1 = new Urun("TV", "OLED ekranlı", 7000);
    dbHelper.ekle(urun1);
    Urun urun2 = new Urun("Bilgisayar", "16 GB Ram", 11000);
    dbHelper.ekle(urun2);
    Urun urun3 = new Urun("Saat", "Duvar Saati", 3000);
    dbHelper.ekle(urun3);
    Urun urun4 = new Urun("Telefon", "Akıllı telefon", 4000);
    dbHelper.ekle(urun4);*/

    return MaterialApp(
      title: "E-Ticaret Uygulaması",
      home: AnaSayfa(),
    );
  }
}

@override
class AnaSayfa extends StatefulWidget {
  State<StatefulWidget> createState() {
    return AnaSayfaState();
  }
}

class AnaSayfaState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Ticaret Uygulaması"),
      ),
      body: UrunListesi(),
    );
  }
}
