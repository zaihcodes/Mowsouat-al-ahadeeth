import 'package:dartz/dartz.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/core/network/netwotk_info.dart';
import 'package:hadeeth/src/category/data/data%20source/category_remote_date_source.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/domain/entities/category_detail.dart';
import 'package:hadeeth/src/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final NetworkInfo networkInfo;
  final CategoryRemoteDataSource categoryRemoteDataSource;

  const CategoryRepositoryImpl(
      {required this.networkInfo, required this.categoryRemoteDataSource});

  @override
  Future<Either<Failure, List<Category>>> getAllCategories(
      {required String lang}) async {
    if (await networkInfo.isConnected) {
      try {
        final categories =
            await categoryRemoteDataSource.getAllCategories(lang: lang);
        return Right(categories);
      } catch (e) {
        return Left(ServerFailure(message: ''));
      }
    } else {
      return Left(OfflineFailure(message: 'offline'));
    }
  }

  @override
  Future<Either<Failure, CategoryDetail>> getCategoryDetail(
      {required String lang,
      required String categoryId,
      required String page,
      required String perPage}) async {
    if (await networkInfo.isConnected) {
      try {
        final categoryDetail = await categoryRemoteDataSource.getCategoryDetail(
            lang: lang, categoryId: categoryId, page: page, perPage: perPage);
        return Right(categoryDetail);
      } catch (e) {
        return Left(ServerFailure(message: ''));
      }
    } else {
      return Left(OfflineFailure(message: 'offline'));
    }
  }
}
