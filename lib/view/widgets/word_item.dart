import 'package:flutter/material.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/screens/word_details_view.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class WordItem extends StatelessWidget {
  final WordModel wordModel;
  const WordItem({super.key, required this.wordModel, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WordDetailsView(wordModel: wordModel, index: index);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(wordModel.colorCode),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            wordModel.text,
            style: const TextStyle(
              fontSize: 20,
              color: ColorManager.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
