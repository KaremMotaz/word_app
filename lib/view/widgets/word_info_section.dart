import 'package:flutter/material.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/widgets/label_widget.dart';
import 'package:hive_app/view/widgets/word_info_widget.dart';

class WordInfoSection extends StatelessWidget {
  const WordInfoSection({super.key, required this.wordModel});

  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWidget(text: wordModel.text, colorCode: wordModel.colorCode),
        SizedBox(height: 8),
        WordInfoWidget(wordModel: wordModel),
      ],
    );
  }
}
