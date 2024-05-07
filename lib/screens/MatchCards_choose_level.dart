import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:rehab_hub/data/MatchCards_data.dart';
import 'package:rehab_hub/screens/MatchCards_flipcard.dart';
// import 'data.dart';
// import 'flipcard.dart';
class ChooseLevel extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChooseLevelState createState() => _ChooseLevelState();
}

class _ChooseLevelState extends State<ChooseLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => _list[index].goto,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: _list[index].primarycolor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black45,
                                spreadRadius: 0.5,
                                offset: Offset(3, 4))
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: _list[index].secondarycolor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black12,
                                spreadRadius: 0.3,
                                offset: Offset(
                                  5,
                                  3,
                                ))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            _list[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                    offset: Offset(1, 2),
                                  ),
                                  Shadow(
                                      color: Colors.green,
                                      blurRadius: 2,
                                      offset: Offset(0.5, 2))
                                ]),
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: genratestar(_list[index].num_star),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> genratestar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}

class Details {
  String name;
  Color primarycolor;

  Color secondarycolor;
  late Widget goto;
  late int num_star;
  Details(
      {required this.name,
      required this.primarycolor,
      required this.secondarycolor,
       required this.num_star,
       required this.goto
      });
}

List<Details> _list = [
  Details(
    name: "Easy",
    primarycolor: Colors.green,
    secondarycolor: const Color.fromARGB(255, 182, 199, 182),
    num_star: 2,
    goto:FlipCardGame(Level.easy)
  ),
  Details(
    name: "Medium",
    primarycolor: Colors.orange,
    secondarycolor: Color.fromARGB(255, 205, 182, 148),
    num_star: 3,
        goto:FlipCardGame(Level.medium)

  ), Details(
    name: "Hard",
    primarycolor: Colors.red,
    secondarycolor: const Color.fromARGB(255, 176, 106, 101),
    num_star: 4,
        goto:FlipCardGame(Level.hard)

  ),
];