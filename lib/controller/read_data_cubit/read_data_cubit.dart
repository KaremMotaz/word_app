import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/hive_constants.dart';
import 'package:hive_app/models/word_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
part 'read_data_state.dart';

typedef Words = List<WordModel>;

class ReadDataCubit extends Cubit<ReadDataState> {
  ReadDataCubit() : super(ReadDataInitialState()) {
    _listenToWordsChanges();
  }

  static ReadDataCubit get(context) => BlocProvider.of<ReadDataCubit>(context);

  final Box _box = Hive.box(HiveConstants.wordsBox);

  LanguageFilter languageFilter = LanguageFilter.allWords;
  SortedBy sortedBy = SortedBy.wordLength;
  SortingType sortingType = SortingType.ascending;

  void _listenToWordsChanges() {
    _box.watch(key: HiveConstants.wordsList).listen((event) {
      getWords();
    });
  }

  // ─── Public API ───────────────────────────────────────────────
  void updateLanguageFilter(LanguageFilter filter) {
    languageFilter = filter;
    getWords();
  }

  void updateSortedBy(SortedBy by) {
    sortedBy = by;
    getWords();
  }

  void updateSortingType(SortingType type) {
    sortingType = type;
    getWords();
  }

  void getWords() {
    emit(ReadDataLoadingState());
    try {
      final words = List<WordModel>.from(
        _box.get(HiveConstants.wordsList, defaultValue: <WordModel>[]),
      );

      final filtered = _applyLanguageFilter(words);
      final sorted = _applySorting(filtered);

      emit(ReadDataSuccessState(words: sorted));
    } catch (e) {
      emit(ReadDataFailureState(message: "Failed to get data: $e"));
    }
  }

  // ─── Private Helpers ──────────────────────────────────────────
  Words _applyLanguageFilter(Words words) {
    switch (languageFilter) {
      case LanguageFilter.allWords:
        return words;
      case LanguageFilter.arabicOnly:
        return words.where((w) => w.isArabic).toList();
      case LanguageFilter.englishOnly:
        return words.where((w) => !w.isArabic).toList();
    }
  }

  Words _applySorting(Words words) {
    switch (sortedBy) {
      case SortedBy.time:
        return sortingType == SortingType.ascending
            ? words
            : words.reversed.toList();

      case SortedBy.wordLength:
        final sorted = [...words]
          ..sort((a, b) => a.text.length.compareTo(b.text.length));
        return sortingType == SortingType.ascending
            ? sorted
            : sorted.reversed.toList();
    }
  }
}

// ─── Enums ─────────────────────────────────────────────────────
enum LanguageFilter { arabicOnly, englishOnly, allWords }

enum SortedBy { time, wordLength }

enum SortingType { ascending, descending }
