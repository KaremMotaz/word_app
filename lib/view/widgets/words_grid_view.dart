import 'package:flutter/material.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/widgets/word_item.dart';

class WordsGridView extends StatelessWidget {
  const WordsGridView({super.key, required this.words});
  final List<WordModel> words;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2 / 1.5,
        ),
        itemCount: words.length,
        itemBuilder: (context, index) {
          return WordItem(wordModel: words[index]);
        },
      ),
    );
  }
}
