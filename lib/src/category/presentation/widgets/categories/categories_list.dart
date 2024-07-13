import 'package:flutter/material.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/presentation/widgets/categories/category_item.dart';
import 'package:hadeeth/src/category/presentation/widgets/categories/single_category.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        // return SingleCategory(category: category);
        return CategoryItem(category: category);
      },
    );
  }
}
