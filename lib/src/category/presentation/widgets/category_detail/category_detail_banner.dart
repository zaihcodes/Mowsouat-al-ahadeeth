import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailBanner extends StatelessWidget {
  const CategoryDetailBanner({super.key, required this.categoryTitle});
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 40,
            left: 30,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 18,
              ),
            )),
        SizedBox(
          height: 250,
          width: double.infinity,
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
                    style: GoogleFonts.almarai().copyWith(
                        fontSize: 35, overflow: TextOverflow.ellipsis),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
