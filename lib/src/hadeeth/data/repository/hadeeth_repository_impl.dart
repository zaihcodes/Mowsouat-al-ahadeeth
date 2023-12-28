import 'package:dartz/dartz.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/hadeeth/data/data%20source/hadeeth_data_source.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/hadeeth.dart';
import 'package:hadeeth/src/hadeeth/domain/repository/hadeeth_repository.dart';

class HadeethRepositoryImpl implements HadeethRepository {
  final HadeethDataSource hadeethDataSource;
  const HadeethRepositoryImpl({required this.hadeethDataSource});

  @override
  Future<Either<Failure, Hadeeth>> getHadeeth(
      {required String hadeethId, required String lang}) async {
    try {
      final hadeeths =
          await hadeethDataSource.getHadeeth(lang: 'ar', hadeethId: hadeethId);
      return Right(hadeeths);
    } catch (e) {
      return Left(ServerFailure(message: 'Something is going wwrong'));
    }
  }
}
