class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel decrementIndexAtDatabase() {
    return WordModel(
      indexAtDatabase: indexAtDatabase - 1,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel addExamples({
    required String example,
    required bool isArabicExample,
  }) {
    List<String> newExamples = _initializeExamples(
      isArabicExample: isArabicExample,
    );
    newExamples.add(example);

    return _getExamplesAfterCheckExample(
      isArabicExample: isArabicExample,
      newExamples: newExamples,
    );
  }

  WordModel deleteExample({
    required int indexAtExample,
    required bool isArabicExample,
  }) {
    List<String> newExamples = _initializeExamples(
      isArabicExample: isArabicExample,
    );

    newExamples.removeAt(indexAtExample);
    return _getExamplesAfterCheckExample(
      isArabicExample: isArabicExample,
      newExamples: newExamples,
    );
  }

  WordModel addSimilarWord({
    required String similarWord,
    required bool isArabicSimilarWord,
  }) {
    List<String> newSimilarWords = _initializeSimilarWords(
      isArabicSimilarWord: isArabicSimilarWord,
    );
    newSimilarWords.add(similarWord);

    return _getWordsAfterCheckSimilarWord(
      isArabicSimilarWord: isArabicSimilarWord,
      newSimilarWords: newSimilarWords,
    );
  }

  WordModel deleteSimilarWord({
    required int indexAtSimilarWord,
    required bool isArabicSimilarWord,
  }) {
    List<String> newSimilarWords = _initializeSimilarWords(
      isArabicSimilarWord: isArabicSimilarWord,
    );

    newSimilarWords.removeAt(indexAtSimilarWord);
    return _getWordsAfterCheckSimilarWord(
      isArabicSimilarWord: isArabicSimilarWord,
      newSimilarWords: newSimilarWords,
    );
  }

  List<String> _initializeExamples({required bool isArabicExample}) {
    if (isArabicExample) {
      return List.from(arabicExamples);
    } else {
      return List.from(englishExamples);
    }
  }

  List<String> _initializeSimilarWords({required bool isArabicSimilarWord}) {
    if (isArabicSimilarWord) {
      return List.from(arabicSimilarWords);
    } else {
      return List.from(englishSimilarWords);
    }
  }

  WordModel _getWordsAfterCheckSimilarWord({
    required bool isArabicSimilarWord,
    required List<String> newSimilarWords,
  }) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: isArabicSimilarWord
          ? newSimilarWords
          : arabicSimilarWords,
      englishSimilarWords: !isArabicSimilarWord
          ? newSimilarWords
          : englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel _getExamplesAfterCheckExample({
    required bool isArabicExample,
    required List<String> newExamples,
  }) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: isArabicExample ? newExamples : arabicExamples,
      englishExamples: !isArabicExample ? newExamples : englishExamples,
    );
  }
}
