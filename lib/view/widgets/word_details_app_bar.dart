import 'package:flutter/material.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/models/word_model.dart';

class WordDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WordDetailsAppBar({super.key, required this.wordModel});
  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    final wordColor = Color(wordModel.colorCode);

    return AppBar(
      foregroundColor: wordColor,
      title: Text("Word Details", style: TextStyle(color: wordColor)),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            deleteWord(context);
          },
        ),
      ],
    );
  }

  void deleteWord(BuildContext context) {
    WriteDataCubit.get(
      context,
    ).deleteWord(indexAtDatabase: wordModel.indexAtDatabase);
    Navigator.pop(context);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
