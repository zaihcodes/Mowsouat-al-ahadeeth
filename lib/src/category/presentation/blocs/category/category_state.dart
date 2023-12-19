part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final String message;
  CategoryError({required this.message});
  @override
  List<Object?> get props => [message];
}

class CategoryOffline extends CategoryState {}

class CategoryEmptyData extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  CategoryLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}
