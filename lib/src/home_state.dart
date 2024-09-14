import 'package:feint_calculator/src/home.dart';
import 'package:flutter/material.dart';

class HomePageState extends State<HomePage> {
  num lastResult = 0;
  String operator = "";
  String result = "0";
  String errorMessage = "";

  onNumberKeyPress(String input) {
    setState(() {
      if (result == "0" || result.startsWith("=")) {
        result = input;
      } else {
        result += input;
      }
    });
  }

  onOperatorPress(String op) {
    setState(() {
      operator = op;
      lastResult = int.tryParse(result) ?? 0;
      result = "";
    });
  }

  onCancelPress() {
    setState(() {
      result = "0";
      lastResult = 0;
      operator = "";
      errorMessage = "";
    });
  }

  onEqualToPress() {
    setState(() {
      if (operator == "+") {
        lastResult += int.tryParse(result) ?? 0;
      } else if (operator == "-") {
        lastResult -= int.tryParse(result) ?? 0;
      } else if (operator == "*") {
        lastResult *= int.tryParse(result) ?? 0;
      } else if (operator == "/") {
        var baseNumber = int.tryParse(result) ?? 0;
        if (baseNumber == 0) {
          errorMessage = "Can not divide by zero";
          lastResult = 0;
          result = "";
        } else {
          lastResult /= baseNumber;
        }
      } else {
        lastResult = int.tryParse(result) ?? 0;
      }

      result = "=$lastResult";
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(errorMessage),
          Text(result),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  onNumberKeyPress("1");
                },
                child: const Text("1"),
              ),
              TextButton(
                onPressed: () {
                  onNumberKeyPress("2");
                },
                child: const Text("2"),
              ),
              TextButton(
                onPressed: () {
                  onNumberKeyPress("3");
                },
                child: const Text("3"),
              ),
              TextButton(
                onPressed: () {
                  onOperatorPress("+");
                },
                child: const Text("+"),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  onNumberKeyPress("4");
                },
                child: const Text("4"),
              ),
              TextButton(
                onPressed: () {
                  onNumberKeyPress("3");
                },
                child: const Text("5"),
              ),
              TextButton(
                onPressed: () {
                  onNumberKeyPress("6");
                },
                child: const Text("6"),
              ),
              TextButton(
                onPressed: () {
                  onOperatorPress("-");
                },
                child: const Text("-"),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  onNumberKeyPress("7");
                },
                child: const Text("7"),
              ),
              TextButton(
                onPressed: () {
                  onNumberKeyPress("8");
                },
                child: const Text("8"),
              ),
              TextButton(
                onPressed: () {
                  onNumberKeyPress("9");
                },
                child: const Text("9"),
              ),
              TextButton(
                onPressed: () {
                  onOperatorPress("/");
                },
                child: const Text("/"),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: onCancelPress,
                child: const Text("C"),
              ),
              TextButton(
                onPressed: () {
                  onNumberKeyPress("0");
                },
                child: const Text("0"),
              ),
              TextButton(
                onPressed: onEqualToPress,
                child: const Text("="),
              ),
              TextButton(
                onPressed: () {
                  onOperatorPress("*");
                },
                child: const Text("*"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
