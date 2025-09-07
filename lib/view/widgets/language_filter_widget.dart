import 'package:flutter/material.dart';
import 'package:hive_app/view/widgets/custom_language_item.dart';

class LanguageFilterWidget extends StatelessWidget {
  const LanguageFilterWidget({
    super.key,
    required this.isArabicSelected,
    required this.activeColorCode,
  });
  final bool isArabicSelected;
  final int activeColorCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomLanguageItem(
          langTitle: 'ar',
          isArabicSelected: isArabicSelected,
          activeColorCode: activeColorCode,
          buildIsArabic: true,
        ),
        SizedBox(width: 7),
        CustomLanguageItem(
          langTitle: 'en',
          isArabicSelected: isArabicSelected,
          activeColorCode: activeColorCode,
          buildIsArabic: false,
        ),
      ],
    );
  }
}
