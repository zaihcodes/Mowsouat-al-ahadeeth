import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeeth/core/utils/no_internet_screen.dart';
import 'package:hadeeth/core/utils/widgets/banner_widget.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الأحاديث النبوية',
              style: GoogleFonts.changa(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BannerWidget(
            title: categoryTitle,
            subTitl: 'الأحاديث النبوية',
            hasBacNavigator: false,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                  // color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
                builder: (context, state) {
                  if (state is CategoryDetailLoading) {
                    return const SizedBox(
                        child: Center(child: CircularProgressIndicator()));
                  } else if (state is CategoryDetailLoaded) {
                    return CategoryDetailList(
                        categoriesDetail: state.categoriesDetail);
                  } else if (state is CategoryDetailEmptyData) {
                    return const Center(
                      child: Text('No categories available.'),
                    );
                  } else if (state is CategoryDetailError) {
                    return Center(
                      child: Text('Error: ${state.message}'),
                    );
                  } else if (state is CategoryDetailOffline) {
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
