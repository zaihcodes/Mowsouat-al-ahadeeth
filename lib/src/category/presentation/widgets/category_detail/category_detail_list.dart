import 'package:flutter/material.dart';
import 'package:hadeeth/src/category/domain/entities/category_detail.dart';
import 'package:hadeeth/src/category/presentation/widgets/category_detail/category_detail_item.dart';

class CategoryDetailList extends StatelessWidget {
  const CategoryDetailList({super.key, required this.categoriesDetail});
  final CategoryDetail categoriesDetail;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoriesDetail.data.length,
      itemBuilder: (context, index) {
        final categoryHadeeth = categoriesDetail.data[index];
        return CategoryDetailItem(categoryHadeeth: categoryHadeeth);
      },
    );
  }
}
