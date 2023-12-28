import 'package:dartz/dartz.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/hadeeth.dart';

abstract class HadeethRepository {
  Future<Either<Failure, Hadeeth>> getHadeeth(
      {required String hadeethId, required String lang});
}
