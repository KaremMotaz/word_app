import 'package:flutter/material.dart';
import 'package:hive_app/view/widgets/filtered_fields.dart';
import 'package:hive_app/view/widgets/label_text.dart';

class FilterSection extends StatelessWidget {
  final String label;
  final List<String> labels;
  final List<VoidCallback> onTaps;
  final List<bool> conditions;

  const FilterSection({
    super.key,
    required this.label,
    required this.labels,
    required this.onTaps,
    required this.conditions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(label: label),
        FilteredFields(
          labels: labels,
          onTaps: onTaps,
          conditionsOfActivations: conditions,
        ),
      ],
    );
  }
}
