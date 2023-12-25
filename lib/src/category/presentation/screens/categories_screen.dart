import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/domain/entities/category_detail.dart';
import 'package:hadeeth/src/category/presentation/blocs/category/category_bloc.dart';
import 'package:hadeeth/src/category/presentation/blocs/category_detail/category_detail_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
        builder: (context, state) {
          if (state is CategoryDetailLoading) {
            return const SizedBox(
                child: Center(child: CircularProgressIndicator()));
          } else if (state is CategoryDetailLoaded) {
            return buildCategoryList(state.categoriesDetail);
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

  Widget buildCategoryList(CategoryDetail categoryDetail) {
    return ListView.builder(
      itemCount: categoryDetail.data.length,
      itemBuilder: (context, index) {
        final hadeeth = categoryDetail.data[index];
        return Container(
          padding: const EdgeInsets.all(20),
          child: Text(hadeeth.title),
          // Add more category information as needed
        );
      },
    );
  }
}
