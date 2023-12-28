import 'package:hadeeth/src/hadeeth/domain/entities/word_meaning.dart';

class WordMeaningModel extends WordMeaning {
  const WordMeaningModel({required super.word, required super.meaning});

  factory WordMeaningModel.fromJson(Map<String, dynamic> json) {
    return WordMeaningModel(
      word: json['word'] as String,
      meaning: json['meaning'] as String,
    );
  }
}
