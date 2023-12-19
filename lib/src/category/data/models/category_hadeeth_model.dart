import 'package:hadeeth/src/category/domain/entities/category_hadeeth.dart';

class CategoryHadeethModel extends CategoryHadeeth {
  CategoryHadeethModel(
      {required super.id, required super.title, required super.translations});
  factory CategoryHadeethModel.fromJson(Map<String, dynamic> json) {
    return CategoryHadeethModel(
      id: json['id'],
      title: json['title'],
      translations: (json['translations'] as List)
          .map((item) => item.toString())
          .toList(),
    );
  }
}
