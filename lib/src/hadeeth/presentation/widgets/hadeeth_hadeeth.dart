import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HadeethHadeeth extends StatelessWidget {
  const HadeethHadeeth({
    super.key,
    required this.hadeeth,
  });

  final String hadeeth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        hadeeth,
        textAlign: TextAlign.center,
        style: GoogleFonts.changa(),
      ),
    );
  }
}
