import 'package:flutter/material.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/widgets/label_widget.dart';
import 'package:hive_app/view/widgets/update_word_dialog.dart';
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
            WordInfoAddButton(
              colorCode: wordModel.colorCode,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return UpdateWordDialog(
                      isExample: false,
                      colorCode: wordModel.colorCode,
                      indexAtDatabase: wordModel.indexAtDatabase,
                    );
                  },
                );
              },
            ),
          ],
        ),
        SizedBox(height: 8),
        ...wordModel.arabicSimilarWords.asMap().entries.map(
          (word) => WordInfoWidget(
            onPressed: () {
              WriteDataCubit.get(context).deleteSimilarWord(
                indexAtDatabase: wordModel.indexAtDatabase,
                isArabicSimilarWord: true,
                indexAtSimilarWord: word.key,
              );
            },
            colorCode: wordModel.colorCode,
            isArabic: true,
            text: word.value,
          ),
        ),

        ...wordModel.englishSimilarWords.asMap().entries.map(
          (word) => WordInfoWidget(
            onPressed: () {
              WriteDataCubit.get(context).deleteSimilarWord(
                indexAtDatabase: wordModel.indexAtDatabase,
                isArabicSimilarWord: false,
                indexAtSimilarWord: word.key,
              );
            },
            colorCode: wordModel.colorCode,
            isArabic: false,
            text: word.value,
          ),
        ),
      ],
    );
  }
}
