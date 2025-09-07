import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/hive_constants.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'write_data_state.dart';

class WriteDataCubit extends Cubit<WriteDataState> {
  static WriteDataCubit get(context) =>
      BlocProvider.of<WriteDataCubit>(context);

  WriteDataCubit() : super(WriteDataInitialState());

  final Box _box = Hive.box(HiveConstants.wordsBox);

  String text = "";
  bool isArabic = true;
  int colorCode = 0XFF4A47A3;

  void updateText({required String text}) {
    this.text = text;
    emit(WriteDataInitialState());
  }

  void updateIsArabic({required bool isArabic}) {
    this.isArabic = isArabic;
    emit(WriteDataInitialState());
  }

  void updateColorCode({required int colorCode}) {
    this.colorCode = colorCode;
    emit(WriteDataInitialState());
  }

  void addSimilarWord({required int indexAtDatabase}) {
    _tryAndCatchBlock(
      methodToExcute: () {
        List<WordModel> words = _getWordsFromDataBase();
        words[indexAtDatabase] = words[indexAtDatabase].addSimilarWord(
          similarWord: text,
          isArabicSimilarWord: isArabic,
        );
        _box.put(HiveConstants.wordsList, words);
      },
      message: "We have problems when we add similar word , please try again",
    );
  }

  void addExample({required int indexAtDatabase}) {
    _tryAndCatchBlock(
      methodToExcute: () {
        List<WordModel> words = _getWordsFromDataBase();
        words[indexAtDatabase] = words[indexAtDatabase].addExamples(
          example: text,
          isArabicExample: isArabic,
        );
        _box.put(HiveConstants.wordsList, words);
      },
      message: "We have problems when we add example , please try again",
    );
  }

  void deleteExample({
    required int indexAtDatabase,
    required bool isArabicExample,
    required int indexAtExample,
  }) {
    _tryAndCatchBlock(
      methodToExcute: () {
        List<WordModel> words = _getWordsFromDataBase();
        words[indexAtDatabase] = words[indexAtDatabase].deleteExample(
          indexAtExample: indexAtExample,
          isArabicExample: isArabicExample,
        );
        _box.put(HiveConstants.wordsList, words);
      },
      message: "We have problems when we delete example , please try again",
    );
  }

  void deleteSimilarWord({
    required int indexAtDatabase,
    required bool isArabicSimilarWord,
    required int indexAtSimilarWord,
  }) {
    _tryAndCatchBlock(
      methodToExcute: () {
        List<WordModel> words = _getWordsFromDataBase();
        words[indexAtDatabase] = words[indexAtDatabase].deleteSimilarWord(
          indexAtSimilarWord: indexAtSimilarWord,
          isArabicSimilarWord: isArabicSimilarWord,
        );
        _box.put(HiveConstants.wordsList, words);
      },
      message:
          "We have problems when we delete similar word , please try again",
    );
  }

  void addWord() {
    _tryAndCatchBlock(
      methodToExcute: () {
      final words = List<WordModel>.from(_getWordsFromDataBase());
        words.add(
          WordModel(
            indexAtDatabase: words.length,
            text: text,
            isArabic: isArabic,
            colorCode: colorCode,
          ),
        );
        _box.put(HiveConstants.wordsList, words);
      },
      message: "We have problems when we add word , please try again",
    );
  }

  void deleteWord({required int indexAtDatabase}) {
    _tryAndCatchBlock(
      methodToExcute: () {
        List<WordModel> words = _getWordsFromDataBase();
        words.removeAt(indexAtDatabase);
        for (var i = indexAtDatabase; i < words.length; i++) {
          words[i] = words[i].decrementIndexAtDatabase();
        }
        _box.put(HiveConstants.wordsList, words);
      },
      message: "We have problems when we delete word , please try again",
    );
  }

  void _tryAndCatchBlock({
    required VoidCallback methodToExcute,
    required String message,
  }) {
    emit(WriteDataLoadingState());
    try {
      methodToExcute.call();
      emit(WriteDataSuccessState());
    } catch (e) {
      emit(WriteDataFailureState(message: message));
    }
  }

  List<WordModel> _getWordsFromDataBase() {
    return List.from(
      _box.get(HiveConstants.wordsList, defaultValue: []),
    ).cast<WordModel>();
  }
}
