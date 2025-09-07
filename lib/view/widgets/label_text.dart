import 'package:flutter/material.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: ColorManager.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}