import 'package:hive/hive.dart';
import 'word_model.dart';

class WordModelAdapter extends TypeAdapter<WordModel> {
  @override
  final int typeId = 0;

  @override
  WordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return WordModel(
      indexAtDatabase: fields[0] as int,
      text: fields[1] as String,
      isArabic: fields[2] as bool,
      colorCode: fields[3] as int,
      arabicSimilarWords: (fields[4] as List).cast<String>(),
      englishSimilarWords: (fields[5] as List).cast<String>(),
      arabicExamples: (fields[6] as List).cast<String>(),
      englishExamples: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer
      ..writeByte(8) 
      ..writeByte(0)
      ..write(obj.indexAtDatabase)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isArabic)
      ..writeByte(3)
      ..write(obj.colorCode)
      ..writeByte(4)
      ..write(obj.arabicSimilarWords)
      ..writeByte(5)
      ..write(obj.englishSimilarWords)
      ..writeByte(6)
      ..write(obj.arabicExamples)
      ..writeByte(7)
      ..write(obj.englishExamples);
  }
}
