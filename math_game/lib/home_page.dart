import 'dart:math';

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
  String userAnswer = "";

  void buttonTapped(String button) {
    setState(() {
      if (button == "=") {
        checkResult();
      } else if (button == "C") {
        userAnswer = "";
      } else if (button == "DEL") {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  int numberA = 1;
  int numberB = 2;

  void checkResult() {
    if (numberA * numberB == int.parse(userAnswer)) {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: AlertDialog(
            backgroundColor: Colors.deepPurple,
            content: Container(
              height: 90,
              color: Colors.deepPurple,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Correct",
                      style: Constants.questionText,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next Question",
                        style: Constants.nextText,
                      ),
                      IconButton(
                          onPressed: nextQuestion,
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 40,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ));
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: AlertDialog(
            backgroundColor: Colors.deepPurple,
            content: Container(
              height: 50,
              color: Colors.deepPurple,
              child: Center(
                child: Text(
                  "İncorrect",
                  style: Constants.questionText,
                ),
              ),
            ),
          ));
        },
      );
    }
  }
  var randomNumber = Random();

  void nextQuestion() {
    Navigator.pop(context);
    setState(() {
      userAnswer = "";
    });
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(children: [
        Container(
          child: Center(
              child: Text(
            "Math Game",
            style: Constants.titleText,
          )),
          height: 160,
          color: Colors.deepPurple[400],
        ),

        // question
        Expanded(
            child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  numberA.toString() + " x " + numberB.toString() + " = ",
                  style: Constants.questionText,
                ),
                // answer box
                Container(
                  child: Center(
                      child: Text(
                    userAnswer,
                    style: Constants.questionText,
                  )),
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(5)),
                )
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
                    return NumberKey(
                      onTap: () => buttonTapped(numberPad[index]),
                      child: numberPad[index],
                    );
                  },
                ),
              ),
            ))
      ]),
    );
  }
}
