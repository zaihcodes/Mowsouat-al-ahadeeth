import 'package:hadeeth/src/hadeeth/data/models/word_meaning_model.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/hadeeth.dart';

class HadeethModel extends Hadeeth {
  const HadeethModel({
    required String id,
    required String title,
    required String hadeeth,
    required String attribution,
    required String grade,
    required String explanation,
    required List<String> hints,
    required List<String> categories,
    required List<String> translations,
    required List<WordMeaningModel> wordsMeanings,
    required String reference,
  }) : super(
          id: id,
          title: title,
          hadeeth: hadeeth,
          attribution: attribution,
          grade: grade,
          explanation: explanation,
          hints: hints,
          categories: categories,
          translations: translations,
          wordsMeanings: wordsMeanings,
          reference: reference,
        );

  factory HadeethModel.fromJson(Map<String, dynamic> json) {
    return HadeethModel(
      id: json['id'] as String,
      title: json['title'] as String,
      hadeeth: json['hadeeth'] as String,
      attribution: json['attribution'] as String,
      grade: json['grade'] as String,
      explanation: json['explanation'] as String,
      hints: (json['hints'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      translations: (json['translations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      wordsMeanings: (json['words_meanings'] as List<dynamic>)
          .map((e) => WordMeaningModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reference: json['reference'] as String,
    );
  }
}
