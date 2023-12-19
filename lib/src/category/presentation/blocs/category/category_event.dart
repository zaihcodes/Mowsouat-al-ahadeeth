part of 'category_bloc.dart';

abstract class CategoryEvent {}

class GetAllCategories extends CategoryEvent {
  final String lang;
  GetAllCategories({required this.lang});
}
