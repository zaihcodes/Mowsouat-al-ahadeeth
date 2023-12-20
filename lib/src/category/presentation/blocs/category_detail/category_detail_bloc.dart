import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/category/domain/entities/category_detail.dart';
import 'package:hadeeth/src/category/domain/usecases/category_detail_usecase.dart';

part 'category_detail_event.dart';
part 'category_detail_state.dart';

class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final CategoryDetailUsecase categoryDetailUsecase;
  CategoryDetailBloc({required this.categoryDetailUsecase})
      : super(CategoryDetailInitial()) {
    on<GetCategoryDetail>(_getCategoryDetail);
  }

  void _getCategoryDetail(
      GetCategoryDetail event, Emitter<CategoryDetailState> emit) async {
    emit(CategoryDetailLoading());
    final failureOrCategories = await categoryDetailUsecase.getCategoryDetail(
        categoryId: event.categoryId,
        lang: event.lang,
        page: event.page,
        perPage: event.perPage);

    failureOrCategories.fold(
        (failure) => emit(_mapFailureToState(failure)),
        (categoriesDetail) =>
            emit(CategoryDetailLoaded(categoriesDetail: categoriesDetail)));
  }

  CategoryDetailState _mapFailureToState(Failure failure) {
    switch (failure.runtimeType) {
      case EmptyDataFailure:
        return CategoryDetailEmptyData();
      case ServerFailure:
        return CategoryDetailError(message: 'Server error: ${failure.message}');
      case OfflineFailure:
        return CategoryDetailOffline();
      default:
        return CategoryDetailError(
            message: 'Unexpected error: ${failure.toString()}');
    }
  }
}
