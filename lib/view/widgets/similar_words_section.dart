import 'package:flutter/material.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/widgets/label_widget.dart';
import 'package:hive_app/view/widgets/word_info_add_button.dart';
import 'package:hive_app/view/widgets/word_info_widget.dart';

class SimilarWordsSection extends StatelessWidget {
  const SimilarWordsSection({super.key, required this.wordModel});

  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelWidget(text: "Similar Words", colorCode: wordModel.colorCode),
            WordInfoAddButton(colorCode: wordModel.colorCode, onTap: () {}),
          ],
        ),
        SizedBox(height: 8),
        WordInfoWidget(wordModel: wordModel),
      ],
    );
  }
}