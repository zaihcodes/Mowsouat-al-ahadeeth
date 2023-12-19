import 'package:dartz/dartz.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/category/domain/entities/category_detail.dart';
import 'package:hadeeth/src/category/domain/repository/category_repository.dart';

class CategoryDetailUsecase {
  final CategoryRepository categoryRepo;
  const CategoryDetailUsecase({required this.categoryRepo});
  Future<Either<Failure, CategoryDetail>> getCategoryDetail(
      {required String categoryId,
      String lang = 'ar',
      String page = '1',
      String perPage = '20'}) async {
    return await categoryRepo.getCategoryDetail(
        lang: lang, categoryId: categoryId, page: page, perPage: perPage);
  }
}
