import 'package:flutter_eticaret_app/Database/dbHelper.dart';
import 'package:flutter_eticaret_app/Models/Urun.dart';
import 'package:flutter/material.dart';

class UrunEkle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UrunEKleState();
  }
}

class UrunEKleState extends State {
  DbHelper dbHelper = new DbHelper();

  TextEditingController txtAd = new TextEditingController();
  TextEditingController txtAciklama = new TextEditingController();
  TextEditingController txtFiyat = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni ürün ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          TextField(
            controller: txtAd,
            decoration: InputDecoration(
                labelText: "Ad",
                hintText: "Adınızı buraya yazınız",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                )),
                icon: Icon(Icons.accessible_forward)),
          ),
          Padding(padding: EdgeInsets.all(7.0)),
          TextField(
            controller: txtAciklama,
            decoration: InputDecoration(
                labelText: "Açıklama",
                hintText: "Açıklamayı buraya yazınız",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.deepPurple)),
                icon: Icon(Icons.ac_unit_sharp)),
          ),
          Padding(padding: EdgeInsets.all(7.0)),
          TextField(
            controller: txtFiyat,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Fiyat",
              hintText: "Fiyatı buraya yazınız",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.blue)),
              icon: Icon(Icons.abc),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ekle();
              },
              child: Text("Ekle"))
        ]),
      ),
    );
  }

  void ekle() async {
    int sonuc = await dbHelper.ekle(
        Urun(txtAd.text, txtAciklama.text, double.tryParse(txtFiyat.text)!));
    if (sonuc != 0) {
      Navigator.pop(context, true);
      AlertDialog alert = new AlertDialog(
        title: Text("İşlem başarıyla gerçekleşti"),
        content: Text("Ürün Eklendi ${txtAd.text}"),
      );
      showDialog(context: context, builder: (_) => alert);
    }
  }
}
