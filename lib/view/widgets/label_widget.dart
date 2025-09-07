import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.colorCode, required this.text});

  final String text;
  final int colorCode;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(colorCode),
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
