import 'package:dartz/dartz.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/domain/entities/category_detail.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories(
      {required String lang});
  Future<Either<Failure, CategoryDetail>> getCategoryDetail(
      {required String lang,
      required String categoryId,
      required String page,
      required String perPage});
}
