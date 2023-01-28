import 'package:flutter_eticaret_app/Database/dbHelper.dart';
import 'package:flutter_eticaret_app/Models/Urun.dart';
import 'package:flutter/material.dart';

class UrunDetay extends StatefulWidget {
  Urun urun;
  UrunDetay(this.urun);

  @override
  State<StatefulWidget> createState() {
    return UrunDetayState(urun);
  }
}

enum Secenek { sil, guncelle }

DbHelper dbHelper = new DbHelper();

class UrunDetayState extends State {
  Urun urun;
  UrunDetayState(this.urun);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ürün detayı"),
          actions: <Widget>[
            PopupMenuButton<Secenek>(
                onSelected: islemSec,
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Secenek>>[
                      PopupMenuItem<Secenek>(
                        value: Secenek.sil,
                        child: Text("Ürünü sil"),
                      ),
                      PopupMenuItem<Secenek>(
                          value: Secenek.guncelle,
                          child: Text("Ürünü güncelle")),
                    ])
          ],
          backgroundColor: Colors.amber[400],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.add_business),
                title: Text(urun.ad),
                subtitle: Text(urun.aciklama),
              ),
              Text("${urun.ad} için fiyatı: ${urun.fiyat} TL"),
              ButtonBar(
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        AlertDialog alert = new AlertDialog(
                          title: Text("Ürün eklendi: ${urun.ad}"),
                          content: Text("İşlem başarıyla gerçekleşmiştir"),
                        );
                        showDialog(context: context, builder: (_) => alert);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      icon: Icon(Icons.add_box_rounded),
                      label: Text("Sepete ekle"))
                ],
              )
            ],
          ),
        ));
  }

  void islemSec(Secenek secenek) async {
    int sonuc;
    switch (secenek) {
      case Secenek.sil:
        Navigator.pop(context, true);
        sonuc = await dbHelper.Sil(urun.id!);
        if (sonuc != 0) {
          AlertDialog alert = new AlertDialog(
            title: Text("İşlem başarı ile gerçekleşmiştir"),
            content: Text("Ürün silindi : ${urun.ad}"),
          );
          showDialog(context: context, builder: (_) => alert);
        }
        break;
    }
  }
}
