import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeeth/core/utils/no_internet_screen.dart';
import 'package:hadeeth/core/utils/widgets/banner_widget.dart';
import 'package:hadeeth/src/category/presentation/blocs/category/category_bloc.dart';
import 'package:hadeeth/src/category/presentation/widgets/categories/categories_banner.dart';
import 'package:hadeeth/src/category/presentation/widgets/categories/categories_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const BannerWidget(title: 'الأحاديث النبوية', subTitl: 'موسوعة'),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                  // color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  debugPrint('State is ${state.runtimeType}');
                  if (state is CategoryLoading) {
                    return const SizedBox(
                        child: Center(child: CircularProgressIndicator()));
                  } else if (state is CategoryLoaded) {
                    return CategoriesList(
                      categories: state.categories,
                    );
                  } else if (state is CategoryEmptyData) {
                    return const Center(
                      child: Text('No categories available.'),
                    );
                  } else if (state is CategoryError) {
                    return Center(
                      child: Text('Error: ${state.message}'),
                    );
                  } else if (state is CategoryOffline) {
                    return const NoInternetScreen();
                  } else {
                    return const Center(
                      child: Text('Unexpected state'),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
