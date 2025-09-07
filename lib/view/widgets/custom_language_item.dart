import 'package:flutter/material.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class CustomLanguageItem extends StatelessWidget {
  const CustomLanguageItem({
    super.key,
    required this.langTitle,
    required this.isArabicSelected,
    required this.activeColorCode,
    required this.buildIsArabic,
  });
  final String langTitle;
  final bool isArabicSelected;
  final bool buildIsArabic;
  final int activeColorCode;

  bool get isActive => isArabicSelected == buildIsArabic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WriteDataCubit.get(context).updateIsArabic(isArabic: buildIsArabic);
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: isActive ? ColorManager.white : Color(activeColorCode),
          shape: BoxShape.circle,
          border: Border.all(color: ColorManager.white, width: 2),
        ),
        child: Center(
          child: Text(
            langTitle,
            style: TextStyle(
              color: isActive ? Color(activeColorCode) : ColorManager.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
