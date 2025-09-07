import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/controller/read_data_cubit/read_data_cubit.dart';
import 'package:hive_app/view/widgets/no_words_widget.dart';
import 'package:hive_app/view/widgets/words_failure_widget.dart';
import 'package:hive_app/view/widgets/words_grid_view.dart';
import 'package:hive_app/view/widgets/words_loading_widget.dart';

class WordsWidget extends StatelessWidget {
  const WordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        if (state is ReadDataSuccessState) {
          return state.words.isEmpty
              ? const NoWordsWidget()
              : WordsGridView(words: state.words);
        } else if (state is ReadDataFailureState) {
          return WordsFailureWidget(message: state.message);
        } else if (state is ReadDataLoadingState) {
          return const WordsLoadingWidget();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
