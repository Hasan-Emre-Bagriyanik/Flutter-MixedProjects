import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_my_project/Screens/Personel_add.dart';

import 'Personel.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Personel selectedPersonel = Personel.withId(0, "", "", 0);
  Personel kidemi = Personel.withId(0, "", "", 0);
  Personel unvan = Personel.withId(0, "", "", 0);

  List<Personel> personelListesi = [
    Personel.withId(1, "Hasan Emre", "Bağrıyanık", 15),
    Personel.withId(2, "Mehmet Ali", "Sivri", 6),
    Personel.withId(3, "veysel", "Uğurlu", 1),
    Personel.withId(4, "Devrim", "Furkan", 20),
    Personel.withId(5, "Mustafa", "Veysel", 21)
  ];

  @override
  Widget build(BuildContext context) {
    var personeller = [
      "Hasan Emre Bağrıyanık",
      "Mehmet Ali Sivri",
      "Veysel Uğurlu",
      "Devrim Furkan",
      "Mustafa Veysel",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Çalışanlar Listesi"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(children: [
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
                    personelListesi[index].GetDurm),
                trailing: StatusIcon(personelListesi[index].kidem),
                onTap: () {
                  setState(() {
                    selectedPersonel = personelListesi[index];
                    kidemi = personelListesi[index];
                    unvan = personelListesi[index];
                  });
                },
              );
            },
          ),
        ),
        Text("Seçili personel: " + selectedPersonel.ad),
        Text("Kİdem: " + kidemi.kidem.toString()),
        Text("Unvanı: " + unvan.GetDurm),
        Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      alignment: Alignment.center),
                  child: Row(
                    children: const [
                      Icon(Icons.add_box_outlined),
                      SizedBox(
                        width: 6,
                        height: 10,
                      ),
                      const Text("Ekle"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                personelAdd(personelListesi))).then((value) {
                      setState(() {});
                    });
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    child: Row(
                      children: const [
                        Icon(Icons.delete),
                        SizedBox(
                          width: 8,
                          height: 10,
                        ),
                        Text("Sil"),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        personelListesi.remove(selectedPersonel);
                      });

                      var alert = AlertDialog(
                        title: Text("Personel işlemleri"),
                        content: Text(selectedPersonel.ad +
                            " " +
                            selectedPersonel.soyad +
                            " silindi"),
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => alert);
                    }))
          ],
        )
      ]),
    );
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

Widget StatusIcon(int kidem) {
  if (kidem >= 3) {
    return (Icon(Icons.check_box_outline_blank));
  } else if (kidem >= 6) {
    return (Icon(Icons.access_time_filled_sharp));
  } else {
    return (Icon(Icons.ac_unit_rounded));
  }
}
