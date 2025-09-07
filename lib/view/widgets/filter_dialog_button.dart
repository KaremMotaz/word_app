import 'package:flutter/material.dart';
import 'package:hive_app/view/styles/color_manager.dart';
import 'package:hive_app/view/widgets/filter_dialog.dart';

class FilterDialogButton extends StatelessWidget {
  const FilterDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorManager.white,
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return FilterDialog();
            },
          );
        },
        icon: Icon(Icons.filter_list_outlined, color: ColorManager.black),
      ),
    );
  }
}

