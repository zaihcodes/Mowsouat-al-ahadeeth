import 'package:hadeeth/src/category/data/models/category_hadeeth_model.dart';
import 'package:hadeeth/src/category/data/models/category_meta_model.dart';
import 'package:hadeeth/src/category/domain/entities/category_detail.dart';

class CategoryDetailModel extends CategoryDetail {
  CategoryDetailModel({required super.data, required super.meta});

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<CategoryHadeethModel> categoryHadeethList =
        dataList.map((e) => CategoryHadeethModel.fromJson(e)).toList();

    return CategoryDetailModel(
      data: categoryHadeethList,
      meta: CategoryMetaModel.fromJson(json['meta']),
    );
  }
}
