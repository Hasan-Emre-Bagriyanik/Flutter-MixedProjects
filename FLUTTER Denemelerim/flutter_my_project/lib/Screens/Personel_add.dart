import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_project/Validation(dogrulama)/personel_validator.dart';

import '../Personel.dart';

class personelAdd extends StatefulWidget {
  late List<Personel> personelListesi;

  personelAdd(List<Personel> personelListesi) {
    this.personelListesi = personelListesi;
  }

  @override
  State<StatefulWidget> createState() {
    return _PersonelAddState(personelListesi);
  }
}

class _PersonelAddState extends State with PersonelValidationMixin {
  late List<Personel> personelListesi;
  var personel = Personel.WithoutInfo();
  var formKey = GlobalKey<FormState>();

  _PersonelAddState(List<Personel> personelListesi) {
    this.personelListesi = personelListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Yeni Personel Ekle",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightGreen[300],
        ),
        body: Container(
          margin: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: "Personel Adı",
                        hintText: "Ad",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                      ),
                      validator: (value) {
                        return validateAd(value.toString());
                      },
                      onSaved: (value) {
                        personel.ad = value.toString();
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.accessible_outlined),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2)),
                          labelText: "Personel Soyadı",
                          hintText: "Soyad"),
                      validator: ((value) {
                        return validateSoyad(value.toString());
                      }),
                      onSaved: (value) {
                        personel.soyad = value.toString();
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.add_alert),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          labelText: "Personel Kidemi",
                          hintText: "Kıdem"),
                      validator: ((value) {
                        return validateKidem(value.toString());
                      }),
                      onSaved: (value) {
                        personel.kidem = int.parse(value.toString());
                      }),
                  SavedButton(),
                ],
              )),
        ));
  }

  Widget SavedButton() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple)),
        child: Text("Kaydet"),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState?.save();
            personelListesi.add(personel);
            Navigator.pop(context);
          }
        });
  }
}
