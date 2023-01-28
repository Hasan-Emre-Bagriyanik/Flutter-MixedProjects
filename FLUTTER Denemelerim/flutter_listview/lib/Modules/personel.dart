class Personel {
  late String ad;
  late String soyad;
  late int id;
  late int kidem;

  Personel(String ad, String soyad, int kidem) {
    this.ad = ad;
    this.soyad = soyad;

    this.kidem = kidem;
  }

  Personel.withId(int id, String ad, String soyad, int kidem) {
    this.ad = ad;
    this.soyad = soyad;
    this.id = id;
    this.kidem = kidem;
  }
  String get getDurum {
    String mesaj = "";

    if (this.kidem < 5) {
      mesaj = "Kidemli";
    } else if (this.kidem < 8) {
      mesaj = "Uzman";
    } else {
      mesaj = "Kidemli uzman";
    }

    return mesaj;
  }
}
