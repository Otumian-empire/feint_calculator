import 'package:feint_calculator/src/button_widget.dart';
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
    if (op == "C") {
      onCancelPress();
    } else if (op == "=") {
      onEqualToPress();
    } else {
      setState(() {
        operator = op;
        lastResult = int.tryParse(result) ?? lastResult;
        result = "";
      });
    }
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

      operator = "";
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
              ButtonWidget(
                label: "1",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "2",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "3",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "+",
                onPressFunction: onOperatorPress,
              ),
            ],
          ),
          Row(
            children: [
              ButtonWidget(
                label: "4",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "5",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "6",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "-",
                onPressFunction: onOperatorPress,
              ),
            ],
          ),
          Row(
            children: [
              ButtonWidget(
                label: "7",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "8",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "9",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                label: "/",
                onPressFunction: onOperatorPress,
              ),
            ],
          ),
          Row(
            children: [
              ButtonWidget(
                label: "C",
                onPressFunction: onOperatorPress,
              ),
              ButtonWidget(
                label: "0",
                onPressFunction: onNumberKeyPress,
              ),
              ButtonWidget(
                onPressFunction: onOperatorPress,
                label: "=",
              ),
              ButtonWidget(
                onPressFunction: onOperatorPress,
                label: "*",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
