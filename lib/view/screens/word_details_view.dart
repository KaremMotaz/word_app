import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/controller/read_data_cubit/read_data_cubit.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_app/view/widgets/word_details_app_bar.dart';
import 'package:hive_app/view/widgets/word_details_view_body.dart';
import 'package:hive_app/view/widgets/words_failure_widget.dart';
import 'package:hive_app/view/widgets/words_loading_widget.dart';

class WordDetailsView extends StatefulWidget {
  const WordDetailsView({
    super.key,
    required this.wordModel,
    required this.index,
  });
  final WordModel wordModel;
  final int index;

  @override
  State<WordDetailsView> createState() => _WordDetailsViewState();
}

class _WordDetailsViewState extends State<WordDetailsView> {
  late WordModel _wordModel;
  @override
  void initState() {
    _wordModel = widget.wordModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WordDetailsAppBar(wordModel: _wordModel),
      body: BlocBuilder<ReadDataCubit, ReadDataState>(
        builder: (context, state) {
          if (state is ReadDataSuccessState) {
            if (widget.index < 0 || widget.index >= state.words.length) {
              return const Center(child: SizedBox.shrink());
            }
            _wordModel = state.words[widget.index];
            return WordDetailsViewBody(wordModel: _wordModel);
          } else if (state is ReadDataFailureState) {
            return WordsFailureWidget(message: state.message);
          } else if (state is ReadDataLoadingState) {
            return const WordsLoadingWidget();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
