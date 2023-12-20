part of 'category_detail_bloc.dart';

abstract class CategoryDetailEvent extends Equatable {
  const CategoryDetailEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryDetail extends CategoryDetailEvent {
  final String lang;
  final String categoryId;
  final String page;
  final String perPage;

  const GetCategoryDetail(
      {required this.lang,
      required this.categoryId,
      required this.page,
      required this.perPage});

  @override
  List<Object> get props => [lang, categoryId, page, perPage];
}
