import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeeth/src/category/domain/entities/category_hadeeth.dart';

class CategoryDetailItem extends StatelessWidget {
  const CategoryDetailItem({
    super.key,
    required this.categoryHadeeth,
  });

  final CategoryHadeeth categoryHadeeth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.read<CategoryDetailBloc>().add(GetCategoryDetail(
        //     lang: 'ar', categoryId: category.id, page: '1', perPage: '40'));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             CategoryDetailScreen(categoryId: category.id)));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      width: 1),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 14,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                categoryHadeeth.title,
                textAlign: TextAlign.end,
                style: GoogleFonts.changa().copyWith(),
              ),
            ),
          ],
        ),
        // Add more category information as needed
      ),
    );
  }
}
