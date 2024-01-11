import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeeth/src/category/presentation/blocs/category/category_bloc.dart';
import 'package:hadeeth/src/category/presentation/screens/categories_screen.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'لا يوجد إنترنت',
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  context
                      .read<CategoryBloc>()
                      .add(GetAllCategories(lang: 'ar'));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoriesScreen()),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(1, 2)),
                      ]),
                  child: const Text(
                    'حاول مرة أخرى',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
