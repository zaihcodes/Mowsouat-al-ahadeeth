import 'package:flutter/material.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/presentation/screens/category_detail_screen.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryDetailScreen(categoryId: category.id)));
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
            Expanded(
              child: Text(
                category.title,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        // Add more category information as needed
      ),
    );
  }
}
