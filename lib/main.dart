import 'package:adam_asmaca/ui/colors.dart';
import 'package:adam_asmaca/ui/widget/figure_image.dart';
import 'package:adam_asmaca/ui/widget/letter.dart';
import 'package:adam_asmaca/utils/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  String word = "ramazan".toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          title: const Text("Adam Asmaca"),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Stack(children: [
                figureImage(Game.tries >= 0, "assets/hang.png"),
                figureImage(Game.tries >= 1, "assets/head.png"),
                figureImage(Game.tries >= 2, "assets/body.png"),
                figureImage(Game.tries >= 3, "assets/ra.png"),
                figureImage(Game.tries >= 4, "assets/la.png"),
                figureImage(Game.tries >= 5, "assets/rl.png"),
                figureImage(Game.tries >= 6, "assets/ll.png")
              ])),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: word
                      .split('')
                      .map((e) => letter(e.toUpperCase(),
                          !Game.selectedChar.contains(e.toUpperCase())))
                      .toList()),
              SizedBox(
                  width: double.infinity,
                  height: 250.0,
                  child: GridView.count(
                      crossAxisCount: 7,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      padding: const EdgeInsets.all(8.0),
                      children: alphabets.map((e) {
                        return RawMaterialButton(
                            onPressed: Game.selectedChar.contains(e)
                                ? null
                                : () {
                                    setState(() {
                                      Game.selectedChar.add(e);
                                      if (!word
                                          .split('')
                                          .contains(e.toUpperCase())) {
                                        Game.tries++;
                                      }
                                    });
                                  },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            fillColor: Game.selectedChar.contains(e)
                                ? Colors.black87
                                : Colors.blue,
                            child: Text(e,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold)));
                      }).toList()))
            ]));
  }
}
