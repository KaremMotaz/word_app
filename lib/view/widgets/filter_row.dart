import 'package:flutter/material.dart';
import 'package:hive_app/view/widgets/filter_dialog_button.dart';
import 'package:hive_app/view/widgets/language_filter.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [LanguageFillterWidget(), FilterDialogButton()],
    );
  }
}