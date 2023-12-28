import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key, required this.categoryId});
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('categoryId: $categoryId')),
    );
  }
}
