import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';

class NumberKey extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.deepPurple[400];
  NumberKey({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (child == "C") {
      buttonColor = Colors.green;
    } else if (child == "DEL") {
      buttonColor = Colors.amber;
    } else if (child == "=") {
      buttonColor = Colors.deepPurple;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              child,
              style: Constants.questionText,
            ),
          ),
        ),
      ),
    );
  }
}
