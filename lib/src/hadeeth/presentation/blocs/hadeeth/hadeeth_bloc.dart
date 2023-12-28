import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/hadeeth/domain/entities/hadeeth.dart';
import 'package:hadeeth/src/hadeeth/domain/usecases/hadeeth_usecase.dart';

part 'hadeeth_event.dart';
part 'hadeeth_state.dart';

class HadeethBloc extends Bloc<HadeethEvent, HadeethState> {
  final HadeethUsecase hadeethUsecase;
  HadeethBloc({required this.hadeethUsecase}) : super(HadeethInitial()) {
    on<GetHadeeth>(_getHadeeth);
  }

  void _getHadeeth(GetHadeeth event, Emitter<HadeethState> emit) async {
    emit(HadeethLoading());
    final failureOrHadeeth =
        await hadeethUsecase(lang: event.lang, hadeethId: event.hadeethId);

    failureOrHadeeth.fold((failure) => emit(_mapFailureToState(failure)),
        (hadeeth) => emit(HadeethLoaded(hadeeth: hadeeth)));
  }

  HadeethState _mapFailureToState(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return HadeethError(message: 'Server error: ${failure.message}');
      case OfflineFailure:
        return HadeethOffline();
      default:
        return HadeethError(message: 'Unexpected error: ${failure.toString()}');
    }
  }
}
