import 'package:hadeeth/src/category/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required super.id,
      required super.title,
      required super.hadeethsCount,
      super.parentId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      hadeethsCount: json['hadeeths_count'],
      parentId: json['parent_id'],
    );
  }
}
