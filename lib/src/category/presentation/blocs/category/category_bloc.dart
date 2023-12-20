import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadeeth/core/error/failures.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/domain/usecases/all_categories_usecase.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final AllCategoriesUsecase allCategoriesUsecase;
  CategoryBloc({required this.allCategoriesUsecase})
      : super(CategoryInitial()) {
    on<GetAllCategories>(_getAllCategories);
  }

  void _getAllCategories(
      GetAllCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    final failureOrCategories =
        await allCategoriesUsecase.getAllCategories(lang: event.lang);

    failureOrCategories.fold((failure) => emit(_mapFailureToState(failure)),
        (categories) => emit(CategoryLoaded(categories: categories)));
  }

  CategoryState _mapFailureToState(Failure failure) {
    switch (failure.runtimeType) {
      case EmptyDataFailure:
        return CategoryEmptyData();
      case ServerFailure:
        return CategoryError(message: 'Server error: ${failure.message}');
      case OfflineFailure:
        return CategoryOffline();
      default:
        return CategoryError(
            message: 'Unexpected error: ${failure.toString()}');
    }
  }
}
