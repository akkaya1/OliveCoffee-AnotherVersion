import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // coffees.json
    Future<List<Widget>> coffees() async {
      List<Widget> items = [];
      String dataString = await DefaultAssetBundle.of(context)
          .loadString("assets/coffees.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      for (var element in dataJSON) {
        items.add(Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, spreadRadius: 3, blurRadius: 2)
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    element["image"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(element["name"],
                          style: const TextStyle(
                              fontFamily: "Confession", fontSize: 25)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 3),
                        child: Text(
                          element["description"],
                          softWrap: true,
                          style: const TextStyle(
                              fontFamily: "Confession",
                              fontStyle: FontStyle.italic,
                              fontSize: 14),
                        ),
                      ),
                      Text(
                        element["price"],
                        style: const TextStyle(
                            fontFamily: "Pixel",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
      }
      return items;
    }

    // desserts.json
    Future<List<Widget>> desserts() async {
      List<Widget> items = [];
      String dataString = await DefaultAssetBundle.of(context)
          .loadString("assets/desserts.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      for (var element in dataJSON) {
        items.add(Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, spreadRadius: 3, blurRadius: 2)
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    element["image"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(element["name"],
                          style: const TextStyle(
                              fontFamily: "Confession", fontSize: 25)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 3),
                        child: Text(
                          element["description"],
                          softWrap: true,
                          style: const TextStyle(
                              fontFamily: "Confession",
                              fontStyle: FontStyle.italic,
                              fontSize: 14),
                        ),
                      ),
                      Text(
                        element["price"],
                        style: const TextStyle(
                            fontFamily: "Pixel",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
      }
      return items;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/zeytin.png',
                  fit: BoxFit.contain,
                  height: 61,
                ),
                const Text(
                  "Olive Coffee",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: "Konimasa",
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(MdiIcons.coffee)),
                Tab(icon: Icon(MdiIcons.cupcake)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // coffees.json
              FutureBuilder(
                future: coffees(),
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: ListView(
                      children: [...?snapshot.data],
                    ),
                  );
                },
              ),
              // desserts.json
              FutureBuilder(
                future: desserts(),
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: ListView(
                      children: [...?snapshot.data],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
