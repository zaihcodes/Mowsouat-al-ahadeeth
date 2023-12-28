import 'package:flutter/material.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/word_meaning.dart';

class WordsMeaningWidget extends StatelessWidget {
  const WordsMeaningWidget({
    super.key,
    required this.wordsMeanings,
  });

  final List<WordMeaning> wordsMeanings;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        itemCount: wordsMeanings.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                wordsMeanings[index].word,
                textDirection: TextDirection.rtl,
              ),
              subtitle: Text(
                wordsMeanings[index].meaning,
                textDirection: TextDirection.rtl,
              ),
            ),
          );
        },
      ),
    );
  }
}
