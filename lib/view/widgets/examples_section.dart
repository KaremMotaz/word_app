import 'package:flutter/material.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/widgets/label_widget.dart';
import 'package:hive_app/view/widgets/update_word_dialog.dart';
import 'package:hive_app/view/widgets/word_info_add_button.dart';
import 'package:hive_app/view/widgets/word_info_widget.dart';

class ExamplesSection extends StatelessWidget {
  const ExamplesSection({super.key, required this.wordModel});

  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelWidget(text: "Examples", colorCode: wordModel.colorCode),
            WordInfoAddButton(
              colorCode: wordModel.colorCode,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => UpdateWordDialog(
                    isExample: true,
                    colorCode: wordModel.colorCode,
                    indexAtDatabase: wordModel.indexAtDatabase,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...wordModel.arabicExamples.asMap().entries.map(
          (example) => WordInfoWidget(
            onPressed: () {
              WriteDataCubit.get(context).deleteExample(
                indexAtDatabase: wordModel.indexAtDatabase,
                isArabicExample: true,
                indexAtExample: example.key,
              );
            },
            colorCode: wordModel.colorCode,
            isArabic: true,
            text: example.value,
          ),
        ),
        ...wordModel.englishExamples.asMap().entries.map(
          (example) => WordInfoWidget(
            onPressed: () {
              WriteDataCubit.get(context).deleteExample(
                indexAtDatabase: wordModel.indexAtDatabase,
                isArabicExample: false,
                indexAtExample: example.key,
              );
            },
            colorCode: wordModel.colorCode,
            isArabic: false,
            text: example.value,
          ),
        ),
      ],
    );
  }
}
