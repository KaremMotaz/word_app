import 'package:flutter/material.dart';
import 'package:hive_app/view/styles/color_manager.dart';
import 'package:hive_app/view/widgets/add_word_dialog.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorManager.white,
      shape: const CircleBorder(),
      child: Icon(Icons.add, color: ColorManager.black),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AddWordDialog();
          },
        );
      },
    );
  }
}
