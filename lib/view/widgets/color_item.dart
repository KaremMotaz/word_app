import 'package:flutter/material.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.colorCodes,
    required this.index,
    required this.activeColorCode,
  });

  final List<int> colorCodes;
  final int index;
  final int activeColorCode;

  bool get isActive => activeColorCode == colorCodes[index];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WriteDataCubit.get(
        context,
      ).updateColorCode(colorCode: colorCodes[index]),
      child: Container(
        width: 45,
        decoration: BoxDecoration(
          color: Color(colorCodes[index]),
          border: isActive
              ? Border.all(color: ColorManager.white, width: 2)
              : null,
          shape: BoxShape.circle,
        ),
        child: isActive
            ? const Icon(Icons.check, color: ColorManager.white)
            : null,
      ),
    );
  }
}
