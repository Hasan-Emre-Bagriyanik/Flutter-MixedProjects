class PersonelValidationMixin {
  String? validateAd(String value) {
    if (value.contains("1") ||
        value.contains("2") ||
        value.contains("3") ||
        value.contains("4") ||
        value.contains("5") ||
        value.contains("6") ||
        value.contains("7") ||
        value.contains("8") ||
        value.contains("9")) {
      return "Ad kısmına sayı giremezsizin...";
    } else if (value.length < 2) {
      return "Ad en az iki karakterden olmalıdır.";
    }
  }

  String? validateSoyad(String value) {
    if (value.contains("1") ||
        value.contains("2") ||
        value.contains("3") ||
        value.contains("4") ||
        value.contains("5") ||
        value.contains("6") ||
        value.contains("7") ||
        value.contains("8") ||
        value.contains("9")) {
      return "Ad kısmına sayı giremezsizin...";
    } else if (value.length < 2) {
      return "Soyad en az 2 karakterden oluşmalıdır.";
    }
  }

  String? validateKidem(String value) {
    var kidem = int.parse(value);
    if (0 > kidem) {
      return "Kıdem yılı 0'dan küçük olmamalıdır.";
    } else if (kidem >= 25) {
      return "Kıdem yılı 25'den büyük olammalıdır.";
    }
  }
}
