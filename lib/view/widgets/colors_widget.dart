import 'package:flutter/material.dart';
import 'package:hive_app/view/styles/color_manager.dart';
import 'package:hive_app/view/widgets/color_item.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({super.key, required this.activeColorCode});
  final int activeColorCode;

  final List<int> colorCodes = ColorManager.colorCodes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: colorCodes.length,
        itemBuilder: (context, index) {
          return ColorItem(
            colorCodes: colorCodes,
            index: index,
            activeColorCode: activeColorCode,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 7);
        },
      ),
    );
  }
}
