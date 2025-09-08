import 'package:flutter/material.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/widgets/examples_section.dart';
import 'package:hive_app/view/widgets/similar_words_section.dart';
import 'package:hive_app/view/widgets/word_info_section.dart';

class WordDetailsViewBody extends StatelessWidget {
  const WordDetailsViewBody({
    super.key,
    required this.wordModel,
  });

  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            WordInfoSection(wordModel: wordModel),
            SizedBox(height: 30),
            SimilarWordsSection(wordModel: wordModel),
            SizedBox(height: 30),
            ExamplesSection(wordModel: wordModel),
          ],
        ),
      ),
    );
  }
}
