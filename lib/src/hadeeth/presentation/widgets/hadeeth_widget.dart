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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 100,
                ),
                HadeethHadeeth(hadeeth: hadeeth.hadeeth),
                const SizedBox(
                  height: 30,
                ),
                // Explination
                Text(
                  'الشرح',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.almarai(),
                ),
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
                Text(
                  'معاني الكلمات',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.almarai(),
                ),
                const SizedBox(
                  height: 20,
                ),
                WordsMeaningWidget(wordsMeanings: hadeeth.wordsMeanings)
              ],
            ),
          ),
        ),

        // NAvigate back
        Positioned(
            top: 40,
            left: 30,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.2),
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
            )),
      ],
    );
  }
}
