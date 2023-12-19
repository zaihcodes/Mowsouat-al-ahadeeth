import 'package:hadeeth/src/category/domain/entities/category_meta.dart';

class CategoryMetaModel extends CategoryMeta {
  CategoryMetaModel(
      {required super.currentPage,
      required super.lastPage,
      required super.totalItems,
      required super.perPage});
  factory CategoryMetaModel.fromJson(Map<String, dynamic> json) {
    return CategoryMetaModel(
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      totalItems: json['total_items'],
      perPage: json['per_page'],
    );
  }
}
