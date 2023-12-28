// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WordMeaning extends Equatable {
  final String word;
  final String meaning;
  const WordMeaning({
    required this.word,
    required this.meaning,
  });

  @override
  List<Object?> get props => [word, meaning];
}
