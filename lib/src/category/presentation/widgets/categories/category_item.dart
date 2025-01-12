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
      child: Card(
        color: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  category.title,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.changa(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
