import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_eticaret_app/Models/Urun.dart';

class DbHelper {
  String tblUrun = "urunler";
  String colId = "id";
  String colAd = "ad";
  String colAciklama = "aciklama";
  String colFiyat = "fiyat";

  static final DbHelper _dbHelper = DbHelper.internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await dbOlustur();
    }
    return _db!;
  }

  Future<Database> dbOlustur() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String yol = directory.path + "eticaret.db";
    var eTicaretDb = await openDatabase(yol, version: 1, onCreate: olustur);
    return eTicaretDb;
  }

  DbHelper.internal();

  void olustur(Database db, int version) async {
    await db.execute(
        "Create table $tblUrun($colId integer primary key, $colAd text, $colAciklama text, $colFiyat int)");
  }

  Future<int> ekle(Urun urun) async {
    Database db = await this.db;
    var sonuc = await db.insert(tblUrun, urun.mapYap());
    return sonuc;
  }

  Future<int> guncelle(Urun urun) async {
    Database db = await this.db;
    var sonuc = await db.update(tblUrun, urun.mapYap());
    return sonuc;
  }

  Future<List> getUrunler() async {
    Database db = await this.db;
    var sonuc = await db.rawQuery("Select *from $tblUrun");
    return sonuc;
  }

  Future<int> Sil(int id) async {
    Database db = await this.db;
    var sonuc = await db.rawDelete("Delete from $tblUrun Where $colId = $id");
    return sonuc;
  }
}
