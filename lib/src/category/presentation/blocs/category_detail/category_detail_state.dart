part of 'category_detail_bloc.dart';

abstract class CategoryDetailState extends Equatable {
  const CategoryDetailState();

  @override
  List<Object> get props => [];
}

final class CategoryDetailInitial extends CategoryDetailState {}

class CategoryDetailLoading extends CategoryDetailState {}

class CategoryDetailError extends CategoryDetailState {
  final String message;
  const CategoryDetailError({required this.message});

  @override
  List<Object> get props => [message];
}

class CategoryDetailOffline extends CategoryDetailState {}

class CategoryDetailEmptyData extends CategoryDetailState {}

class CategoryDetailLoaded extends CategoryDetailState {
  final CategoryDetail categoriesDetail;
  const CategoryDetailLoaded({required this.categoriesDetail});

  @override
  List<Object> get props => [categoriesDetail];
}
