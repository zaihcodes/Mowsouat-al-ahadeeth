import 'package:hadeeth/src/category/data/models/category_detail_model.dart';
import 'package:hadeeth/src/category/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories({required String lang});
  Future<CategoryDetailModel> getCategoryDetail(
      {required String lang,
      required String categoryId,
      required String page,
      required String perPage});
}

const BASE_URL = 'https://hadeethenc.com/api/v1/';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getAllCategories({required String lang}) {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<CategoryDetailModel> getCategoryDetail(
      {required String lang,
      required String categoryId,
      required String page,
      required String perPage}) {
    // TODO: implement getCategoryDetail
    throw UnimplementedError();
  }
}
