import 'package:dartz/dartz.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/domain/repository/category_repository.dart';

class AllCategoriesUsecase {
  final CategoryRepository categoryRepo;
  const AllCategoriesUsecase({required this.categoryRepo});
  Future<Either<Failure, List<Category>>> getAllCategories(
      {String lang = 'ar'}) async {
    return await categoryRepo.getAllCategories(lang: lang);
  }
}
