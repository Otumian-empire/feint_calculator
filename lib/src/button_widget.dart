import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final void Function(String someString) onPressFunction;

  const ButtonWidget(
      {super.key, required this.label, required this.onPressFunction});

  @override
  build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressFunction(label),
      child: Text(label),
    );
  }
}
