import 'package:dartz/dartz.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/hadeeth.dart';
import 'package:hadeeth/src/hadeeth/domain/repository/hadeeth_repository.dart';

class HadeethUsecase {
  final HadeethRepository hadeethRepository;
  const HadeethUsecase({required this.hadeethRepository});

  Future<Either<Failure, Hadeeth>> call(
      {required String hadeethId, String lang = 'ar'}) async {
    return await hadeethRepository.getHadeeth(hadeethId: hadeethId, lang: lang);
  }
}
