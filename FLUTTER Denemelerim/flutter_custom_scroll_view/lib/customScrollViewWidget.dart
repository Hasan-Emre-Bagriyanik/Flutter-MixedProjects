import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class customScrollViewWidget extends StatelessWidget {
  get children => null;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Sliver app bar"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver app bar"),
            centerTitle: true,
            background: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzXZ1bg7-tSj3-ycsoxMP5Wi1PIxwiozUwQg&usqp=CAU",
                fit: BoxFit.cover),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(ListeElemanlari())),
        SliverGrid(
            delegate: SliverChildListDelegate(ListeElemanlari()),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3))
      ],
    );
  }

  List<Widget> ListeElemanlari() {
    return [
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.green[200],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 1",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.green[300],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 2",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.green[400],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 3",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.blue[200],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 4",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.blue[300],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 5",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.blue[400],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 6",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.red[200],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 7",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.red[300],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 8",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 100,
        color: Colors.red[400],
        alignment: Alignment.center,
        child: const Text(
          "Bölüm 9",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}
