import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailBanner extends StatelessWidget {
  const CategoryDetailBanner({super.key, required this.categoryTitle});
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الأحاديث النبوية',
                style: GoogleFonts.almarai().copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                categoryTitle,
                style: GoogleFonts.almarai()
                    .copyWith(fontSize: 35, overflow: TextOverflow.ellipsis),
              ),
            ]),
      ),
    );
  }
}
