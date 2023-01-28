import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  TextEditingController kisa1 = new TextEditingController();
  TextEditingController vize = new TextEditingController();
  TextEditingController kisa2 = new TextEditingController();
  TextEditingController odev = new TextEditingController();
  TextEditingController Final = new TextEditingController();

  double toplam = 0;
  double vizeN = 0;
  double kisa1N = 0;
  double kisa2N = 0;
  double odevN = 0;
  double FinalN = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Öğrenci Notu hesaplama",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Form(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.note_add_outlined,
                  ),
                  labelText: "Kısa Sınav 1 Notu ",
                  hintText: "Kısa sınav 1",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.red,
                  ))),
              controller: kisa1,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.note_add_outlined),
                  labelText: "Vize Notu",
                  hintText: "vize",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.red,
                  ))),
              controller: vize,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.note_add_outlined),
                  labelText: "Kısa Sınav 2 Notu",
                  hintText: "Kısa Sınav 2",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.red,
                  ))),
              controller: kisa2,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.note_add_outlined),
                  labelText: "Ödev Notu",
                  hintText: "Ödev",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.red,
                  ))),
              controller: odev,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.note_add_outlined),
                  labelText: "Final Notu",
                  hintText: "Final",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.red,
                  ))),
              controller: Final,
            ),
            ElevatedButton(
                child: Text(
                  "HESAPLA",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                onPressed: (() {
                  kisa1N = double.parse(kisa1.text);
                  kisa2N = double.parse(kisa2.text);
                  odevN = double.parse(odev.text);
                  FinalN = double.parse(Final.text);
                  vizeN = double.parse(vize.text);

                  vizeN = (vizeN * 2) / 10;
                  kisa1N = (kisa1N * 1) / 10;
                  kisa2N = (kisa2N * 1) / 10;
                  odevN = (odevN * 1) / 10;
                  FinalN = (FinalN * 5) / 10;

                  toplam = vizeN + kisa1N + kisa2N + odevN + FinalN;

                  var alert = AlertDialog(
                    title: const Text("Ortamala ve Harf Notu: "),
                    content: Text("Ortalamanız: $toplam " + harfNotu(toplam)),
                  );

                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                }))
          ],
        )),
      ),
    );
  }
}

String harfNotu(puan) {
  if (puan >= 90) {
    return "Harn Notunuz : AA";
  } else if (puan >= 85) {
    return "Harf Notunuz : BA";
  } else if (puan >= 80) {
    return "Harf Notunuz : BB";
  } else if (puan >= 75) {
    return "Harf Notunuz : CB";
  } else if (puan >= 70) {
    return "Harf Notunuz : CC";
  } else if (puan >= 65) {
    return "Harf Notunuz : DC";
  } else if (puan >= 60) {
    return "Harf Notunuz : DD";
  } else if (puan >= 55) {
    return "Harf Notunuz : FD";
  } else {
    return "Harf Notunuz : FF";
  }
}
