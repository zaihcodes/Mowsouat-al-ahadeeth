import 'package:hadeeth/src/category/domain/entities/category_hadeeth.dart';
import 'package:hadeeth/src/category/domain/entities/category_meta.dart';

class CategoryDetail {
  List<CategoryHadeeth> data;
  CategoryMeta meta;

  CategoryDetail({required this.data, required this.meta});
}
