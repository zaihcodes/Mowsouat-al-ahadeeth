import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeeth/src/category/presentation/blocs/category_detail/category_detail_bloc.dart';
import 'package:hadeeth/src/category/presentation/widgets/category_detail/category_detail_banner.dart';
import 'package:hadeeth/src/category/presentation/widgets/category_detail/category_detail_list.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen(
      {super.key, required this.categoryId, required this.categoryTitle});
  final String categoryId;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
        builder: (context, state) {
          if (state is CategoryDetailLoading) {
            return const SizedBox(
                child: Center(child: CircularProgressIndicator()));
          } else if (state is CategoryDetailLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CategoryDetailBanner(
                  categoryTitle: categoryTitle,
                ),
                Expanded(
                  child: CategoryDetailList(
                      categoriesDetail: state.categoriesDetail),
                )
              ],
            );
          } else if (state is CategoryDetailEmptyData) {
            return const Center(
              child: Text('No categories available.'),
            );
          } else if (state is CategoryDetailError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const Center(
              child: Text('Unexpected state'),
            );
          }
        },
      ),
    );
  }
}
