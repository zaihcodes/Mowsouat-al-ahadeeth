import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/hadeeth.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/word_meaning.dart';

class HadeethWidget extends StatelessWidget {
  const HadeethWidget({super.key, required this.hadeeth});
  final Hadeeth hadeeth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSectionTitle('الحديث الشريف', theme),
                    const SizedBox(height: 15),
                    _buildCard(
                      content: hadeeth.hadeeth,
                      textAlign: TextAlign.center,
                      context: context,
                    ),
                    const SizedBox(height: 20),
                    _buildSectionTitle('الشرح', theme),
                    const SizedBox(height: 15),
                    _buildCard(
                      content: hadeeth.explanation,
                      textAlign: TextAlign.right,
                      context: context,
                    ),
                    const SizedBox(height: 20),
                    _buildSectionTitle('معاني الكلمات', theme),
                    const SizedBox(height: 15),
                    WordsMeaningWidget(wordsMeanings: hadeeth.wordsMeanings),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Text(
      title,
      textDirection: TextDirection.rtl,
      style: theme.textTheme.bodyMedium!.copyWith(
        fontFamily: 'Almarai',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildCard({
    required String content,
    TextAlign textAlign = TextAlign.right,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Text(
        content,
        textAlign: textAlign,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.changa(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

class WordsMeaningWidget extends StatelessWidget {
  const WordsMeaningWidget({super.key, required this.wordsMeanings});
  final List<WordMeaning> wordsMeanings;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: wordsMeanings.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                wordsMeanings[index].word,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.almarai(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                wordsMeanings[index].meaning,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.almarai(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
