import 'package:flutter/material.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class WordInfoAddButton extends StatelessWidget {
  const WordInfoAddButton({
    super.key,
    required this.colorCode,
    required this.onTap,
  });

  final int colorCode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        margin: EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
          color: Color(colorCode),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.add, color: ColorManager.black),
      ),
    );
  }
}
