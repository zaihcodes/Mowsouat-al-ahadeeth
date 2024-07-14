import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/hadeeth.dart';
import 'package:hadeeth/src/hadeeth/presentation/widgets/hadeeth_hadeeth.dart';
import 'package:hadeeth/src/hadeeth/presentation/widgets/words_meaning.dart';

class HadeethWidget extends StatelessWidget {
  const HadeethWidget({super.key, required this.hadeeth});
  final Hadeeth hadeeth;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              buildBackIconButton(context),
              const SizedBox(
                height: 40,
              ),
              HadeethHadeeth(hadeeth: hadeeth.hadeeth),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Explination
                  buildTitle(title: 'الشرح'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    hadeeth.explanation,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.changa(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Word meaning
                  buildTitle(
                    title: 'معاني الكلمات',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  WordsMeaningWidget(wordsMeanings: hadeeth.wordsMeanings)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Text buildTitle({required String title}) {
    return Text(
      title,
      textDirection: TextDirection.rtl,
      style: GoogleFonts.almarai().copyWith(
        fontSize: 18,
      ),
    );
  }

  InkWell buildBackIconButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 5,
              )
            ]),
        child: Icon(
          Icons.arrow_back,
          size: 18,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
