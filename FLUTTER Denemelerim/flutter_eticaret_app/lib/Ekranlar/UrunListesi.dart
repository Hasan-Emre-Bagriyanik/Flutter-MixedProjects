import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eticaret_app/Database/dbHelper.dart';
import 'package:flutter_eticaret_app/Ekranlar/UrunDetay.dart';
import 'package:flutter_eticaret_app/Ekranlar/UrunEkle.dart';

import 'package:flutter_eticaret_app/Models/Urun.dart';

class UrunListesi extends StatefulWidget {
  const UrunListesi({super.key});

  @override
  State<StatefulWidget> createState() {
    return UrunListesiState();
  }
}

class UrunListesiState extends State {
  DbHelper dbHelper = new DbHelper();
  List<Urun>? urunler;
  int urunSayisi = 0;

  @override
  Widget build(Object context) {
    if (urunler == null) {
      urunler = <Urun>[];
      getUrunler();
    }

    return Scaffold(
      body: urunListesi(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          urunEkleyeGit();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni ürün ekle",
      ),
    );
  }

  ListView urunListesi() {
    return ListView.builder(
        itemCount: urunSayisi,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.red,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text("A"),
              ),
              title: Text(this.urunler![position].ad),
              subtitle: Text(this.urunler![position].aciklama),
              onTap: () {
                detayaGit(this.urunler![position]);
              },
            ),
          );
        });
  }

  void getUrunler() {
    var dbFuture = dbHelper.dbOlustur();
    dbFuture.then((sonuc) {
      var urunlerFuture = dbHelper.getUrunler();
      urunlerFuture.then((data) {
        List<Urun> urunlerData = <Urun>[];
        var gelenUrunSayisi = data.length;
        for (int i = 0; i < gelenUrunSayisi; i++) {
          urunlerData.add(Urun.fromObject(data[i]));
        }
        setState(() {
          urunler = urunlerData;
          urunSayisi = gelenUrunSayisi;
        });
      });
    });
  }

  void detayaGit(Urun urun) async {
    var sonuc = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => UrunDetay(urun)));
    if (sonuc != null) {
      if (sonuc) {
        getUrunler();
      }
    }
  }

  void urunEkleyeGit() async {
    var sonuc = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => UrunEkle()));
    if (sonuc != null) {
      if (sonuc) {
        getUrunler();
      }
    }
  }
}
