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
    this.kidem = kidem;
    this.id = id;
  }
  Personel.WithoutInfo() {}

  String get GetDurm {
    String message = "";

    if (this.kidem < 5) {
      message = "Kidemli";
    } else if (this.kidem < 8) {
      message = "Uzman";
    } else {
      message = "Kıdemli Uzman";
    }
    return message;
  }
}
