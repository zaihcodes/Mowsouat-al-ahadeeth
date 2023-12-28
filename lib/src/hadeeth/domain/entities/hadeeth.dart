import 'package:equatable/equatable.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/word_meaning.dart';

class Hadeeth extends Equatable {
  final String id;
  final String title;
  final String hadeeth;
  final String attribution;
  final String grade;
  final String explanation;
  final List<String> hints;
  final List<String> categories;
  final List<String> translations;
  final List<WordMeaning> wordsMeanings;

  final String reference;
  const Hadeeth({
    required this.id,
    required this.title,
    required this.hadeeth,
    required this.attribution,
    required this.grade,
    required this.explanation,
    required this.hints,
    required this.categories,
    required this.translations,
    required this.wordsMeanings,
    required this.reference,
  });

  @override
  List<Object?> get props => [id, title];
}
