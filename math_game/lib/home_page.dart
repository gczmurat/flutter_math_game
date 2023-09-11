import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';
import 'package:math_game/util/number_key.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> numberPad = [
    "7",
    "8",
    "9",
    "C",
    "4",
    "5",
    "6",
    "DEL",
    "1",
    "2",
    "3",
    "=",
    "0"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(children: [
        Container(
          height: 160,
          color: Colors.deepPurple,
        ),

        // question
        Expanded(
            child: Container(
          child: Center(
            child: Row(
              children: [
                Text(
                  "2 + 2 = ",
                  style: Constants.questionText,
                ),
                // answer box
              ],
            ),
          ),
        )),

        // number pad
        Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: numberPad.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return NumberKey(child: numberPad[index],);
                  },
                ),
              ),
            ))
      ]),
    );
  }
}
