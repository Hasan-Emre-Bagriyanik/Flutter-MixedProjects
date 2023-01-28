import 'package:flutter/material.dart';
import 'package:flutter_listview/Modules/personel.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Personel selectedPersonel = Personel.withId(0, "", "", 0);
  Personel kidemi = Personel.withId(0, "", "", 0);
  Personel unvan = Personel.withId(0, "", "", 0);

  List<Personel> personelListesi = [
    Personel.withId(1, "Hasan Emre", "Bağrıyanık", 15),
    Personel.withId(2, "Mehmet Ali", "Sivri", 6),
    Personel.withId(3, "Veysel", "Uğurlu", 1)
  ];

  @override
  Widget build(BuildContext context) {
    var personeller = [
      "Hasan Emre Bağrıyanık",
      "Mehmet Ali Sivri",
      "Veysel Uğurlu",
      "Veli Yılmaz"
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(selamVer() + personeller[0]),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: personelListesi.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/originals/5e/57/ac/5e57ac046a8a0ee470e2e59b43833e63.jpg"),
                      ),
                      title: Text(personelListesi[index].ad +
                          " " +
                          personelListesi[index].soyad),
                      subtitle: Text("Kıdem Yılı: " +
                          personelListesi[index].kidem.toString() +
                          " " +
                          personelListesi[index].getDurum),
                      trailing: StatusIcon(personelListesi[index].kidem),
                      onTap: () {
                        setState(() {
                          selectedPersonel = personelListesi[index];
                          kidemi = personelListesi[index];
                          unvan = personelListesi[index];
                        });

                        String message = "";
                        message = personelListesi[index].ad +
                            " " +
                            personelListesi[index].soyad;
                        var alert = AlertDialog(
                          title: const Text("Tıklanılan Kişi"),
                          content: Text(message),
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => alert);
                      },
                    );
                  }),
            ),
            Text("Seçili personel: " + selectedPersonel.ad),
            Text("Kıdemi: " + kidemi.kidem.toString()),
            Text("Ünvanı: " + unvan.getDurum),
            Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.lightGreen)),
                        child: Row(
                          children: const [
                            Icon(Icons.add),
                            SizedBox(
                              width: 6,
                            ),
                            const Text("Ekle"),
                          ],
                        ),
                        onPressed: () {
                          int puan = 55;
                          String mesaj = "";

                          if (puan >= 50) {
                            mesaj = "Dersten Geçtin";
                          } else if (puan >= 45) {
                            mesaj = "Dersten Koşullu Geçtin";
                          } else if (puan < 45) {
                            mesaj = "Dersten Kaldın!";
                          }

                          var alert = AlertDialog(
                            title: const Text("Sınav Sonucu"),
                            content: Text(mesaj),
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => alert);
                        })),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.yellow[700])),
                        child: Row(
                          children: [
                            Icon(Icons.update),
                            SizedBox(
                              width: 6,
                            ),
                            const Text("Güncelle"),
                          ],
                        ),
                        onPressed: () {
                          int puan = 55;
                          String mesaj = "";

                          if (puan >= 50) {
                            mesaj = "Dersten Geçtin";
                          } else if (puan >= 45) {
                            mesaj = "Dersten Koşullu Geçtin";
                          } else if (puan < 45) {
                            mesaj = "Dersten Kaldın!";
                          }

                          var alert = AlertDialog(
                            title: const Text("Sınav Sonucu"),
                            content: Text(mesaj),
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => alert);
                        })),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.delete),
                            SizedBox(
                              width: 6,
                            ),
                            const Text("Sil"),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            personelListesi.remove(selectedPersonel);
                          });
                          var alert = AlertDialog(
                            title: Text("Personel İşlemleri"),
                            content: Text("silindi"),
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => alert);
                        })),
              ],
            ),
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Widget StatusIcon(int kidem) {
    if (kidem >= 3) {
      return (Icon(Icons.check_circle_outline));
    } else if (kidem >= 6) {
      return (Icon(Icons.check_box_outline_blank));
    } else {
      return (Icon(Icons.done_outline));
    }
  }
}

String selamVer() {
  DateTime simdi = new DateTime.now();
  int saat = simdi.hour;

  if (saat < 12) {
    return ("Günaydın ");
  } else if (saat < 18) {
    return ("İyi Günler ");
  } else {
    return ("İyi Akşamlar ");
  }
}
