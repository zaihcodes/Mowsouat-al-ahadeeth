import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeeth/src/category/presentation/blocs/category/category_bloc.dart';
import 'package:hadeeth/src/category/presentation/widgets/categories/categories_banner.dart';
import 'package:hadeeth/src/category/presentation/widgets/categories/categories_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const SizedBox(
                child: Center(child: CircularProgressIndicator()));
          } else if (state is CategoryLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CategoriesBanner(),
                Expanded(
                  child: CategoriesList(
                    categories: state.categories,
                  ),
                )
              ],
            );
          } else if (state is CategoryEmptyData) {
            return const Center(
              child: Text('No categories available.'),
            );
          } else if (state is CategoryError) {
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
