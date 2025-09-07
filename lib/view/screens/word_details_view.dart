import 'package:flutter/material.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/widgets/examples_section.dart';
import 'package:hive_app/view/widgets/similar_words_section.dart';
import 'package:hive_app/view/widgets/word_details_app_bar.dart';
import 'package:hive_app/view/widgets/word_info_section.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key, required this.wordModel});
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WordDetailsAppBar(wordModel: wordModel),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WordInfoSection(wordModel: wordModel),
              SizedBox(height: 40),
              SimilarWordsSection(wordModel: wordModel),
              SizedBox(height: 40),
              ExamplesSection(wordModel: wordModel),
            ],
          ),
        ),
      ),
    );
  }
}
