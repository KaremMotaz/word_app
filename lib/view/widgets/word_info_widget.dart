import 'package:flutter/material.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget({
    super.key,
    this.onPressed,
    required this.colorCode,
    required this.isArabic,
    required this.text,
  });

  final int colorCode;
  final bool isArabic;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 5, top: 8, bottom: 8),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(colorCode),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: ColorManager.black,
            child: Text(
              isArabic ? "ar" : "en",
              style: TextStyle(color: Color(colorCode), fontSize: 20),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: ColorManager.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (onPressed != null)
            IconButton(
              icon: Icon(Icons.delete, color: ColorManager.black, size: 26),
              onPressed: onPressed,
            ),
        ],
      ),
    );
  }
}
