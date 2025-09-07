import 'package:flutter/material.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class FilteredFields extends StatelessWidget {
  const FilteredFields({
    super.key,
    required this.labels,
    required this.onTaps,
    required this.conditionsOfActivations,
  });

  final List<String> labels;
  final List<VoidCallback> onTaps;
  final List<bool> conditionsOfActivations;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(labels.length, (i) {
        final isActive = conditionsOfActivations[i];
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: onTaps[i],
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? ColorManager.white : ColorManager.black,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ColorManager.white, width: 1.5),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                labels[i],
                style: TextStyle(
                  color: isActive ? ColorManager.black : ColorManager.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
