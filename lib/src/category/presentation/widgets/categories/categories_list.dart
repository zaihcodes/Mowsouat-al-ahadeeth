import 'package:flutter/material.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/presentation/widgets/categories/single_category.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40))),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return SingleCategory(category: category);
        },
      ),
    );
  }
}
