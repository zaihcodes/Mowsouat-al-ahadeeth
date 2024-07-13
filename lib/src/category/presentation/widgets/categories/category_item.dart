import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/presentation/blocs/category_detail/category_detail_bloc.dart';
import 'package:hadeeth/src/category/presentation/screens/category_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CategoryDetailBloc>().add(GetCategoryDetail(
            lang: 'ar', categoryId: category.id, page: '1', perPage: '80'));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryDetailScreen(
                      categoryId: category.id,
                      categoryTitle: category.title,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primaryFixedDim,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Theme.of(context).colorScheme.primaryFixedDim,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                      // spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 2))
                ],
              ),
              child: Center(
                child: Text(category.hadeethsCount),
              ),
            ),
            Expanded(
              child: Text(
                category.title,
                textAlign: TextAlign.end,
                style: GoogleFonts.changa(),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 1),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 14,
                )),
          ],
        ),
        // Add more category information as needed
      ),
    );
  }
}
